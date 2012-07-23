(defun call-global (&optional options)
  (shell-command-to-string (concat "global " (or options ""))))

(defun call-global-current-file ()
  (interactive)
  (call-global (concat "-ftv " (buffer-file-name))))