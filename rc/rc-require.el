(require 'evil)
(require 'ace-jump-mode)
(setq ace-jump-mode-case-sensitive-search nil)

(require 'uniquify)
(require 'sr-speedbar)
(require 'expand-region)

(require 'move-text)
(move-text-default-bindings)

;; (require 'undo-tree)
;; (global-undo-tree-mode)

(require 'smex)
(smex-initialize)

(require 'anything)

(require 'paredit)

;; (require 'slime)
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (slime-setup)

(require 'semantic/analyze)
(require 'semantic/analyze/refs)
(require 'semantic/analyze/debug)
(require 'semantic)

(setq semantic-default-submodes
        '(global-semanticdb-minor-mode
          global-semantic-idle-scheduler-mode
          global-semantic-idle-summary-mode
          global-semantic-idle-completions-mode
          global-semantic-decoration-mode
          global-semantic-highlight-func-mode
          global-semantic-mru-bookmark-mode))

(require 'org)
(require 'magit)

;; (require 'auto-complete-config)

;; (defun ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-yasnippet ac-source-gtags ac-source-semantic) ac-sources)))

;; (ac-config-default)
;; (ac-set-trigger-key nil)

(require 'bookmark+)

(setq bm-restore-repository-on-load t)
(require 'bm)

(add-hook' after-init-hook 'bm-repository-load)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)

(add-hook 'kill-emacs-hook '(lambda nil
                                  (bm-buffer-save-all)
                                  (bm-repository-save)))

(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)

(provide 'rc-require)
