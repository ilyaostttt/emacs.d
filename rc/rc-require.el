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

(provide 'rc-require)
