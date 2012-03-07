(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file 'noerror)

(setq package-user-dir (concat dotfiles-dir "elpa/"))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "rc/"))
(add-to-list 'load-path package-user-dir)

(dolist (dir (directory-files package-user-dir))
  (if (not (or (string= "archives" dir)
	       (string= "." dir)
	       (string= ".." dir)))
      (add-to-list 'load-path (concat package-user-dir dir "/"))))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))

(require 'rc-misc)
(require 'rc-yasnippet)
(require 'rc-bindings)
(require 'rc-org)


