(setq default-tab-width 8
      c-default-style "linux")
(setq-default c-basic-offset 8)

(add-hook 'c-mode-common-hook (lambda ()
				(setq show-trailing-whitespace t)
				(setq 'indent-tabs-mode t)
				;; (semantic-initialize)
				))

(setq-default show-trailing-whitespace t)

(highlight-lines-matching-regexp ".\{101\}" "hi-green-b")

(provide 'rc-qtn)
