(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "snippets"))

(provide 'rc-yasnippet)
