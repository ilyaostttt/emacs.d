(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            (local-set-key (kbd "f") 'find-dired)
            (local-set-key (kbd "e") 'find-grep)
            (local-set-key (kbd "u") 'dired-up-directory)
            (local-set-key (kbd "M-u") 'dired-unmark)
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            ))

(provide 'rc-dired)
