;; (setq p4-root-dir "/home/ilya/p4work/bbic3_main/")

(defun p4-command-current-file (command)
  (if (string-prefix-p p4-root-dir (buffer-file-name))
      (progn
	(shell-command (concat "cd " p4-root-dir "; p4 "
			       command
			       " "
			       (substring (buffer-file-name) (length p4-root-dir))))
	(revert-buffer t t))
    (message "Not in a p4 workspace!")))

(defun p4-edit ()
  (interactive)
  (p4-command-current-file "edit"))

(defun p4-revert ()
  (interactive)
  (p4-command-current-file "revert"))

(provide 'p4-commands)