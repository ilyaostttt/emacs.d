(defun helm-clang-filter (string)
  (let ((res "")
        (compl-str "COMPLETION: "))
    (if (string-prefix-p compl-str string)
        (progn
          (setq res (substring string (length compl-str)))
          (let ((index-to-del nil)
                (list-to-del '("[#" "#]" "<#" "#>")))
            (dolist (elem-to-del list-to-del)
              (while (not (null (setq index-to-del (search elem-to-del res))))
                (setq res (concat (substring res
                                             0
                                             index-to-del
                                             )
                                  " "
                                  (substring res
                                             (+ index-to-del (length elem-to-del))))))))
          res)
      string)
    ))

(setq helm-clang-result-string "")

(setq helm-clang-original-buffer nil)

(defun join-string (lst string)
  (let ((result-string (if (null lst)
                           ""
                         (car lst))))
    (dolist (elem (cdr lst))
      (setq result-string (concat result-string string elem)))
    result-string))

(defun clang-complete-helm ()
  (let ((file-current-line (+ 1 (current-line)))
        (file-current-column (+ 1 (current-column)))
        (file-buffer-file-name (buffer-file-name)))
    (setq helm-clang-original-buffer (current-buffer))
    (with-current-buffer (helm-candidate-buffer 'local)
      (let* ((cc-point (concat file-buffer-file-name
                               ":"
                               (number-to-string file-current-line)
                               ":"
                               (number-to-string file-current-column)))
             (cc-pch (if (equal clang-completion-prefix-header "") nil
                       (list "-include-pch"
                             (concat clang-completion-prefix-header ".pch"))))
             (cc-flags (if (listp clang-flags) clang-flags nil))
             (cc-command (append `(,clang "-cc1" "-fsyntax-only")
                                 cc-flags
                                 cc-pch
                                 `("-code-completion-at" ,cc-point)
                                 (list file-buffer-file-name)))
             (cc-buffer-name "*Helm Clang Process Buf*"))
        ;; Start the code-completion process.
        (if file-buffer-file-name
            (progn
              ;; If there is already a code-completion process, kill it first.
              (let ((cc-proc (get-process "Helm Clang Code-Completion")))
                (if cc-proc
                    (delete-process cc-proc)))

              (setq helm-clang-completion-substring "")
              (setq helm-clang-result-string "")
              (setq helm-clang-completion-buffer cc-buffer-name)

              (let ((completion-list (split-string (shell-command-to-string
                                                    (join-string cc-command " "))
                                                   "\n")))
                (when (not (null completion-list))
                  (insert (helm-clang-filter (car completion-list)))
                  (dolist (line (cdr completion-list))
                    (insert "\n")
                    (insert (helm-clang-filter line)))
                  (add-text-properties (point-min) (point-max) '(face helm-grep-match))))))))))

(defun helm-clang-source-header-name (&optional x)
  (concat "Clang Complete in "
          helm-buffer-file-name))

(defun helm-clang-mode-line ()
  "mode line")

(defun helm-clang-default-action (candidate)
  (with-current-buffer helm-clang-original-buffer
    (insert (substring candidate
                       0
                       (search " :" candidate)))))

(defvar helm-clang-source-select
  '((name . "Clang")
    (header-name . helm-clang-source-header-name)
    (init . clang-complete-helm)
    (candidates-in-buffer)
    ;; (match-part . (lambda (candidate)
    ;;                 ;; Match only the tag part of CANDIDATE
    ;;                 ;; and not the filename.
    ;;                 candidate))
    ;; (mode-line . helm-clang-mode-line)
    (action . helm-clang-default-action)
    (persistent-action . (lambda (candidate)
                           (helm-clang-default-action candidate))))
  "Helm source for Clang Complete.")

(defvar helm-clang-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map helm-map)
    (define-key map (kbd "C-w")      'helm-yank-text-at-point)
    map)
  "Keymap used in Clang Complete.")

(defun helm-clang-select(arg)
  (interactive "P")
  (save-buffer)
  (helm :sources 'helm-clang-source-select
        :keymap helm-clang-map
        :input ""
        :buffer "*helm Clang Complete*"))

(provide 'helm-clang)