;;; Clang Code-Completion minor mode, for use with C/Objective-C/C++.

;;; Commentary:

;; This minor mode uses Clang's command line interface for code
;; completion to provide code completion results for C, Objective-C,
;; and C++ source files. When enabled, Clang will provide
;; code-completion results in a secondary buffer based on the code
;; being typed. For example, after typing "struct " (triggered via the
;; space), Clang will provide the names of all structs visible from
;; the current scope. After typing "p->" (triggered via the ">"),
;; Clang will provide the names of all of the members of whatever
;; class/struct/union "p" points to. Note that this minor mode isn't
;; meant for serious use: it is meant to help experiment with code
;; completion based on Clang. It needs your help to make it better!
;;
;; To use the Clang code completion mode, first make sure that the
;; "clang" variable below refers to the "clang" executable,
;; which is typically installed in libexec/. Then, place
;; clang-completion-mode.el somewhere in your Emacs load path. You can
;; add a new load path to Emacs by adding some like the following to
;; your .emacs:
;;
;;   (setq load-path (cons "~/.emacs.d" load-path))
;;
;; Then, use
;;
;;   M-x load-library
;;
;; to load the library in your Emacs session or add the following to
;; your .emacs to always load this mode (not recommended):
;;
;;   (load-library "clang-completion-mode")
;;
;; Once you have done this, you can set various parameters with
;;
;;   M-x customize-group RET clang-completion-mode RET
;;
;; Finally, to try Clang-based code completion in a particular buffer,
;; use M-x clang-completion-mode. When "Clang" shows up in the mode
;; line, Clang's code-completion is enabled.
;;
;; Clang's code completion is based on parsing the complete source
;; file up to the point where the cursor is located. Therefore, Clang
;; needs all of the various compilation flags (include paths, dialect
;; options, etc.) to provide code-completion results. Currently, these
;; need to be placed into the clang-flags variable in a format
;; acceptable to clang. This is a hack: patches are welcome to
;; improve the interface between this Emacs mode and Clang!
;;

;;; Code:
;;; The clang executable
(defcustom clang "clang"
  "The location of the Clang compiler executable"
  :type 'file
  :group 'clang-completion-mode)

;;; Extra compilation flags to pass to clang.
(defcustom clang-flags nil
  "Extra flags to pass to the Clang executable.
This variable will typically contain include paths, e.g., -I~/MyProject."
  :type '(repeat (string :tag "Argument" ""))
  :group 'clang-completion-mode)

;;; The prefix header to use with Clang code completion.
(setq clang-completion-prefix-header "")

;;; The substring we will use to filter completion results
(setq clang-completion-substring "")

;;; The current completion buffer
(setq clang-completion-buffer nil)

(setq clang-result-string "")

;;; Compute the current line in the buffer
(defun current-line ()
  "Return the vertical position of point..."
  (+ (count-lines (point-min) (point))
     (if (= (current-column) 0) 1 0)
     -1))

;;; Set the Clang prefix header
(defun clang-prefix-header ()
  (interactive)
  (setq clang-completion-prefix-header
        (read-string "Clang prefix header> " "" clang-completion-prefix-header
                     "")))

;; Process "filter" that keeps track of the code-completion results
;; produced. We store all of the results in a string, then the
;; sentinel processes the entire string at once.
(defun clang-completion-stash-filter (proc string)
  (setq clang-result-string (concat clang-result-string string)))

;; Filter the given list based on a predicate.
(defun filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

;; Determine whether FIXME: explain better
(defun is-completion-line (line)
  (or (string-match "OVERLOAD:" line)
      (string-match (concat "COMPLETION: " clang-completion-substring) line)))


;; re-process the completions when further input narrows the field
(defun clang-completion-display (buffer)
  (fill-buffer buffer))

(defun fill-buffer (buffer)
  (let* ((all-lines (split-string clang-result-string "\n"))
         (completion-lines (filter 'is-completion-line all-lines)))
    (if (consp completion-lines)
        (progn
          ;; Erase the process buffer.
          (let ((cur (current-buffer)))
            (set-buffer buffer)
            (goto-char (point-min))
            (erase-buffer)
            (set-buffer cur))

          ;; Display the process buffer.
          (display-buffer buffer)

          ;; Insert the code-completion string into the process buffer.
          (with-current-buffer buffer
            (insert (mapconcat 'identity completion-lines "\n")))
          ))))

;; Process "sentinel" that, on successful code completion, replaces the
;; contents of the code-completion buffer with the new code-completion results
;; and ensures that the buffer is visible.
(defun clang-completion-sentinel (proc event)
  (fill-buffer (process-buffer proc)))

(defun clang-complete ()
  (let* ((cc-point (concat (buffer-file-name)
                           ":"
                           (number-to-string (+ 1 (current-line)))
                           ":"
                           (number-to-string (+ 1 (current-column)))))
         (cc-pch (if (equal clang-completion-prefix-header "") nil
                   (list "-include-pch"
                         (concat clang-completion-prefix-header ".pch"))))
         (cc-flags (if (listp clang-flags) clang-flags nil))
         (cc-command (append `(,clang "-cc1" "-fsyntax-only")
                             cc-flags
                             cc-pch
                             `("-code-completion-at" ,cc-point)
                             (list (buffer-file-name))))
         (cc-buffer-name (concat "*Clang Completion for " (buffer-name) "*")))
    ;; Start the code-completion process.
    (if (buffer-file-name)
        (progn
          ;; If there is already a code-completion process, kill it first.
          (let ((cc-proc (get-process "Clang Code-Completion")))
            (if cc-proc
                (delete-process cc-proc)))

          (setq clang-completion-substring "")
          (setq clang-result-string "")
          (setq clang-completion-buffer cc-buffer-name)

          (let ((cc-proc (apply 'start-process
                                (append (lst "Clang Code-Completion" cc-buffer-name)
                                        cc-command))))
            (set-process-filter cc-proc 'clang-completion-stash-filter)
            (set-process-sentinel cc-proc 'clang-completion-sentinel)
            )))))

(defun clang-completion-sentinel-helm (proc event)
  (with-current-buffer "*helm Clang Complete*"
    (insert helm-clang-result-string)))

(defun helm-clang-filter (string)
  (if (string-prefix-p "COMPLETION: " string)
      (substring string 12)
    string))

(setq helm-clang-result-string "")

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

             (dolist (line (split-string (shell-command-to-string
                                          (join-string cc-command " "))
                                         "\n"))
               (insert (helm-clang-filter line))
               (insert "\n"))))))))

(defun helm-clang-source-header-name (&optional x)
  (concat "Clang Complete in "
          helm-buffer-file-name))

(defun helm-clang-mode-line ()
  "mode line")

(defun helm-clang-default-action (candidate)
  (message candidate))

(defvar helm-clang-source-select
  '((name . "Clang")
    (header-name . helm-clang-source-header-name)
    (init . clang-complete-helm)
    (candidates-in-buffer)
    (match-part . (lambda (candidate)
                    ;; Match only the tag part of CANDIDATE
                    ;; and not the filename.
                    candidate))
    (mode-line . helm-clang-mode-line)
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
  (helm :sources 'helm-clang-source-select
        :keymap helm-clang-map
        :input ""
        :buffer "*helm Clang Complete*"))

;; Code-completion when one of the trigger characters is typed into
;; the buffer, e.g., '(', ',' or '.'.
(defun clang-complete-self-insert (arg)
  (interactive "p")
  (self-insert-command arg)
  (save-buffer)
  (clang-complete))

;; When the user has typed a character that requires the filter to be
;; updated, do so (and update the display of results).
(defun clang-update-filter ()
  (setq clang-completion-substring (thing-at-point 'symbol))
  (if (get-process "Clang Code-Completion")
      ()
    (clang-completion-display clang-completion-buffer)
    ))

;; Invoked when the user types an alphanumeric character or "_" to
;; update the filter for the currently-active code completion.
(defun clang-filter-self-insert (arg)
  (interactive "p")
  (self-insert-command arg)
  (clang-update-filter)
  )

;; Invoked when the user types the backspace key to update the filter
;; for the currently-active code completion.
(defun clang-backspace ()
  (interactive)
  (delete-backward-char 1)
  (clang-update-filter))

;; Invoked when the user types the delete key to update the filter
;; for the currently-active code completion.
(defun clang-delete ()
  (interactive)
  (delete-backward-char 1)
  (clang-update-filter))

;; Set up the keymap for the Clang minor mode.
(defvar clang-completion-mode-map nil
  "Keymap for Clang Completion Mode.")

(if (null clang-completion-mode-map)
    (fset 'clang-completion-mode-map
          (setq clang-completion-mode-map (make-sparse-keymap))))

(if (not (assq 'clang-completion-mode minor-mode-map-alist))
    (setq minor-mode-map-alist
          (cons (cons 'clang-completion-mode clang-completion-mode-map)
                minor-mode-map-alist)))

;; Punctuation characters trigger code completion.
(dolist (char '("(" "," "." ">" ":" "=" ")" " "))
  (define-key clang-completion-mode-map char 'clang-complete-self-insert))

;; Alphanumeric characters (and "_") filter the results of the
;; currently-active code completion.
(dolist (char '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O"
                "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"
                "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o"
                "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
                "_" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
  (define-key clang-completion-mode-map char 'clang-filter-self-insert))

;; Delete and backspace filter the results of the currently-active
;; code completion.
(define-key clang-completion-mode-map [(backspace)] 'clang-backspace)
(define-key clang-completion-mode-map [(delete)] 'clang-delete)

;; Set up the Clang minor mode.
(define-minor-mode clang-completion-mode
  "Clang code-completion mode"
  nil
  " Clang"
  clang-completion-mode-map)

(provide 'clang-completion-mode)