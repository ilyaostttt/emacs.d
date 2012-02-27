(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "rc/"))
(add-to-list 'load-path (concat dotfiles-dir "elpa/"))

(dolist (dir (directory-files (concat dotfiles-dir "elpa/")))
  (if (not (or (string= "archives" dir)
	       (string= "." dir)
	       (string= ".." dir)))
      (add-to-list 'load-path (concat dotfiles-dir "elpa/" dir "/"))))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))

(require 'rc-misc)
(require 'rc-yasnippet)
(require 'rc-bindings)
(require 'rc-org)

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
