(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?b (file . ,(concat dotfiles-dir "rc/rc-bindings.el")))
             (?m (file . ,(concat dotfiles-dir "rc/rc-misc.el")))
             (?r (file . ,(concat dotfiles-dir "rc/rc-registers.el")))
             (?y (file . ,(concat dotfiles-dir "snippets/text-mode/")))
             (?p (file . ,(concat org-directory "/projects.org")))
             (?s (file . "~/src/"))
             (?o (file . "~/org/"))))
  (set-register (car r) (cadr r)))

(provide 'rc-registers)
