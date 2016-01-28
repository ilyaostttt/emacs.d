(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
 "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (delete-trailing-whitespace))

(defun add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun pretty-sigma ()
  (font-lock-add-keywords
   nil `(("(?\\(self\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    #x03C2)
                    nil))))))

(add-hook 'coding-hook 'pretty-lambdas)
(add-hook 'coding-hook 'add-watchwords)

(make-char 'greek-iso8859-7 107)

;;; from emacs-fu blog
(defun djcb-gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
      (let ((olddir default-directory)
            (topdir (read-directory-name
                     "gtags: top of source tree:" default-directory)))
        (cd topdir)
        (shell-command "gtags && echo 'created tagfile'")
        (cd olddir)) ; restore
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'")))

(eval-when-compile
  (require 'cl))

(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
   (dolist (buf (buffer-list))
     (with-current-buffer buf
       (if (eq mode major-mode)
           (add-to-list 'buffer-mode-matches buf))))
   buffer-mode-matches))

(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;;;;;;;;;;;;;;;;;;; my-highlight-current-word
(setq my-highlight-table (make-hash-table :test 'equal))

(defface my-highlight-face
  '((t :background "#607b8b" :foreground "white" :bold t))
       "Face for highlighting."
       :group 'basic-faces)

(defun my-highlight-current-word ()
  (interactive)
  (let ((cur-word (concat "\\<" (thing-at-point 'symbol) "\\>")))
    (if (not (gethash cur-word my-highlight-table))
	(progn
	  (puthash cur-word t my-highlight-table)
	  (highlight-regexp cur-word 'my-highlight-face))
      (progn
	(unhighlight-regexp cur-word)
	(remhash cur-word my-highlight-table)))))

(defun my-unhighlight-all ()
  (interactive)
  (maphash (lambda (cur-word val)
	     (unhighlight-regexp cur-word))
	   my-highlight-table)
  (clrhash my-highlight-table))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-search-current-word-forward ()
  (interactive)
  (search-forward (thing-at-point 'symbol)))

(defun my-search-current-word-backward ()
  (interactive)
  (search-backward (thing-at-point 'symbol)))

(defun my-toggle-writable ()
  (interactive)
  (let ((cur-mode (file-modes (buffer-file-name))))
   (if (/= (logand
	    cur-mode
	    #o200)
	   0)
       (set-file-modes (buffer-file-name)
		       (logand cur-mode (lognot #o200)))
     (set-file-modes (buffer-file-name)
		     (logior cur-mode #o200))))
  (revert-buffer nil t))

(provide 'defuns)

