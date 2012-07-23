(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "snippets"))

(setq yas/root-directory `(,(concat dotfiles-dir "snippets")))

(mapc 'yas/load-directory yas/root-directory)

(yas/global-mode)

(provide 'rc-yasnippet)
