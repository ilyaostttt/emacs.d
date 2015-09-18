(add-hook 'c-mode-common-hook (lambda ()
				;; (semantic-initialize)
				(fci-mode)
				(set-fill-column 100)))

(add-hook 'makefile-gmake-mode-hook (lambda ()
				      (fci-mode)
				      (set-fill-column 100)))



(provide 'rc-c-mode)
