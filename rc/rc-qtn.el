(setq default-tab-width 8
      c-default-style "linux")
(setq-default c-basic-offset 8)

(add-hook 'c-mode-common-hook (lambda ()
				(setq show-trailing-whitespace t)
                                ;; (semantic-initialize)
                                ))

;; (setq-default show-trailing-whitespace t)

(set-default 'indent-tabs-mode t)

(provide 'rc-qtn)
