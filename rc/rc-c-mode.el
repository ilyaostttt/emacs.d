(add-hook 'gtags-mode-hook
          (lambda()
            (local-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
            (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag

(add-hook 'c-mode-common-hook (lambda ()
                                (add-watchwords)
                                (hs-minor-mode)
                                (gtags-mode t)
                                (local-set-key  (kbd "C-c o") 'ff-find-other-file)
                                ;; (semantic-initialize)
                                ))

(defun semantic-initialize ()
  (require 'semantic/bovine/c)
  (require 'semantic/symref)

  (require 'semantic/analyze)
  (require 'semantic/analyze/refs)
  (require 'semantic/analyze/debug)
  (require 'semantic)

  (setq semantic-default-submodes
        '(
          global-semanticdb-minor-mode
          global-semantic-idle-scheduler-mode
          global-semantic-idle-summary-mode
          global-semantic-decoration-mode
          global-semantic-highlight-func-mode
          global-semantic-mru-bookmark-mode
          ))

  (semantic-gcc-setup)

  (semantic-mode 1)
  )

(provide 'rc-c-mode)
