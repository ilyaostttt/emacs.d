(if (or (equal (system-name) "ilya-Ideapad-S100")
        (equal (system-name) "ilya-MS-7680")
        (equal (system-name) "ilya-ubuntu-work"))
    (set-frame-font "Consolas-11" nil t))

(setq ace-jump-mode-case-sensitive-search nil)

(require 'uniquify)
(require 'expand-region)

(require 'smex)
(smex-initialize)

(require 'auto-complete-config)
 (defun ac-cc-mode-setup ()
   (setq ac-sources
         (append '(
                   ac-source-yasnippet
                   ac-source-gtags
                   ac-source-semantic
                   )
                 ac-sources)))
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
      fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      truncate-lines t
      uniquify-buffer-name-style 'forward
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab face indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t
      inhibit-startup-screen t
      initial-scratch-message ""
      make-backup-files nil
      package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/")))
      scroll-bar-mode nil
      show-paren-delay 0.025
      show-paren-mode t
      show-paren-style (quote parenthesis)
      tool-bar-mode nil
      write-region-inhibit-fsync t
      stack-trace-on-error t
      x-select-enable-clipboard t)

(custom-set-variables
 '(truncate-lines t)
 '(truncate-partial-width-windows nil))

(show-paren-mode 1)

(set-face-attribute 'show-paren-match nil :foreground "steelblue3" :background "grey14")

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (concat dotfiles-dir ".ido.last"))

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(recentf-mode 1)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; (delete 'try-expand-line hippie-expand-try-functions-list)
;; (delete 'try-expand-list hippie-expand-try-functions-list)
;; (delete 'try-complete-file-name-partially hippie-expand-try-functions-list)
;; (delete 'try-complete-file-name hippie-expand-try-functions-list)

(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(setq windmove-wrap-around nil)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(global-ede-mode t)

(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 50) ; 50 files ought to be enough.

(setq reb-re-syntax 'string)

(require 'mark-more-like-this)

(setq byte-compile-debug t)

(add-hook 'ace-jump-mode-before-jump-hook
             (lambda () (push-mark (point) t))) ;until it's fixed in Maramalade

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap 1)

(require 'smart-operator)

(require 'helm)
(require 'clang-completion-mode)

(provide 'rc-misc)
