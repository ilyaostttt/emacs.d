(setq c-default-style '((c-mode . "awk")
                        (c++-mode . "awk")
                        (java-mode . "java")
                        (awk-mode . "awk")
                        (other . "gnu")))

(add-hook 'c-mode-common-hook (lambda ()
                                (add-watchwords)
                                (electric-pair-mode)))

(provide 'rc-c-mode)
