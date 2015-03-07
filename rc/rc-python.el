 ;; (autoload 'python-mode "python-mode" "Python Mode." t)
 ;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 ;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'highlight-indentation)

(require 'python-mode)

(add-hook 'python-mode-hook
          (lambda ()
	    (linum-mode 1)))

(provide 'rc-python)
