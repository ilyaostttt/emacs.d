(set-frame-font "Monospace 10" nil t)
(setq ace-jump-mode-case-sensitive-search nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(require 'xcscope)
(cscope-setup)

(add-hook 'after-init-hook
	  (lambda ()
	    (load-theme 'sanityinc-tomorrow-eighties)))

(require 'smex)
(smex-initialize)

(require 'auto-complete-config)
(ac-config-default)

(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position nil)

(setq auto-save-default nil
      blink-matching-paren nil
      default-input-method "russian-computer"
      dired-dwim-target t
      dired-recursive-copies 'always
      visible-bell nil
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab face indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      inhibit-startup-screen t
      initial-scratch-message ""
      make-backup-files nil
      show-paren-mode t
      write-region-inhibit-fsync t
      stack-trace-on-error t
      x-select-enable-clipboard t)

(show-paren-mode 1)

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (concat dotfiles-dir ".ido.last"))

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(set-default 'indicate-empty-lines t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(setq windmove-wrap-around nil)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 50) ; 50 files ought to be enough.

(setq reb-re-syntax 'string)

(setq byte-compile-debug t)

(require 'helm)

(setq shell-file-name "bash")
(setq shell-command-switch "-lc")

(require 'rc-p4)

(add-hook 'eshell-mode-hook
	  '(lambda ()
	     (setq eshell-path-env (concat "/usr/local/bin:" (getenv "HOME") "/src/scripts:"  eshell-path-env))
	     (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))))

(require 'fill-column-indicator)
(setq fci-fill-column 100)

(provide 'rc-misc)
