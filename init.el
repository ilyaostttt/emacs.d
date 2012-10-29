(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq package-user-dir (concat dotfiles-dir "elpa/"))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "rc/"))
(add-to-list 'load-path package-user-dir)

(defun add-to-load-path-recursively (dir-to-add)
 (dolist (dir (directory-files dir-to-add))
   (if (not (or (string= "archives" dir)
                (string= "." dir)
                (string= ".." dir)))
       (add-to-list 'load-path (concat dir-to-add dir "/")))))

(add-to-load-path-recursively package-user-dir)
(add-to-load-path-recursively (concat dotfiles-dir "site-lisp/"))
(add-to-list 'load-path (concat dotfiles-dir "elisp/"))
(add-to-load-path-recursively (concat dotfiles-dir "elisp/"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(load autoload-file)

(autoload 'server-running-p "server" )
(if (not (server-running-p))
    (server-start))

(require 'rc-misc)
(require 'rc-defuns)
(require 'rc-yasnippet)
(require 'rc-org)
(require 'rc-registers)
(require 'rc-lisp)
(require 'rc-c-mode)
(require 'rc-dired)
(require 'rc-bindings)
(require 'rc-ede)
(require 'rc-python)

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file 'noerror)
