(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ))

(provide 'rc-dired)
