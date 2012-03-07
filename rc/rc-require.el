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

(require 'ecb-autoloads)

(require 'anything)

(require 'paredit)

(provide 'rc-require)
