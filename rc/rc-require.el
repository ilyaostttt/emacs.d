(require 'ace-jump-mode)
(setq ace-jump-mode-case-sensitive-search nil)

(require 'uniquify)
(require 'sr-speedbar)
(require 'expand-region)

(require 'move-text)
(move-text-default-bindings)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'smex)
(smex-initialize)

(require 'anything)

(require 'paredit)

;; (require 'slime)
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (slime-setup)

(provide 'rc-require)
