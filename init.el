(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

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
       (add-to-list 'load-path (concat package-user-dir dir "/")))))

(add-to-load-path-recursively package-user-dir)

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))

(require 'rc-require)
(require 'rc-defuns)
(require 'rc-misc)
(require 'rc-yasnippet)
(require 'rc-org)
(require 'rc-registers)
(require 'rc-lisp)
(require 'rc-c-mode)
(require 'rc-ecb)
(require 'rc-dired)
(require 'rc-bindings)

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file 'noerror)
