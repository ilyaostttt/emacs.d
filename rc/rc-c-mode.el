(add-hook 'c-mode-common-hook (lambda ()
				;; (semantic-initialize)
				(whitespace-mode)
				))

(provide 'rc-c-mode)
