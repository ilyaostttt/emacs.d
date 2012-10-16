(defun call-global (&optional options)
  (shell-command-to-string (concat "global " (or options ""))))

(defun call-global-current-file ()
  (interactive)
  (call-global (concat "-f --result=grep " helm-buffer-file-name)))

(call-global-current-file)

(defun helm-gglobal-source-header-name (&optional x)
  (concat "Global in "
          helm-buffer-file-name))

(defun helm-gglobal-default-action (candidate)
  (message candidate))

(defvar helm-gglobal-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map helm-map)
    (define-key map (kbd "C-w")      'helm-yank-text-at-point)
    map)
  "Keymap used in Global.")

(defface helm-gglobal-number-face
    '((t (:foreground "Green")))
  "Face used in mode line when grep is finish."
  )

(defun is-space (c)
  (or (eql ?\s c)
      (eql ?\t c)
      (eql ?\n c)))

(defun search-if (sequence predicate)
  (let ((index 0))
    (while (not (funcall predicate (aref sequence index)))
      (setq index (1+ index)))
    index))

(search-if "asdpfjn sdd" 'is-space)

(defun trim-string-beg (s)
  (substring s (search-if s (lambda (c)
                              (not (is-space c))))))

(defun helm-gglobal-init ()
  (with-current-buffer (helm-candidate-buffer 'local)
    (dolist (cand (split-string (call-global-current-file) "\n"))
      (let ((colon-index (search ":" cand)))
        (when colon-index
          (let ((second-colon-index (search ":" cand :start2 (1+ colon-index))))
            (setq line-number-text (substring cand (1+ colon-index) second-colon-index))
            (insert  line-number-text)
            (insert ":    ")
            (insert (substring cand (1+ second-colon-index)))
            ;; (insert (trim-string-beg (substring cand (1+ second-colon-index))))
            (insert "\n")))))))

(defun helm-gglobal-mode-line ()
  "mode line")

(defvar helm-gglobal-source-select
  '((name . "Global")
    (header-name . helm-gglobal-source-header-name)
    (init . helm-gglobal-init)
    (candidates-in-buffer)
    (match-part . (lambda (candidate)
                    ;; Match only the tag part of CANDIDATE
                    ;; and not the filename.
                    (candidate)))
    (mode-line . helm-gglobal-mode-line)
    (action . helm-gglobal-default-action)
    (persistent-action . (lambda (candidate)
                           (helm-gglobal-default-action candidate))))
  "Helm source for GNU Global.")

(defun helm-gglobal-select(arg)
  (interactive "P")
  (helm :sources 'helm-gglobal-source-select
        :keymap helm-gglobal-map
        :input ""
        :buffer "*helm Gnu Global*"))

