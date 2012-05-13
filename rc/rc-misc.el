(if (equal (system-name) "ilya-MS-7680")
    (set-frame-font "Consolas-11" nil t)
  (set-frame-font "Consolas-10" nil t))

(menu-bar-mode -1)

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
      global-hl-line-mode nil
      inhibit-startup-screen t
      initial-scratch-message ""
      make-backup-files nil
      package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/")))
      scroll-bar-mode nil
      show-paren-delay 0.025
      show-paren-mode t
      show-paren-style (quote parenthesis)
      sr-speedbar-skip-other-window-p t
      sr-speedbar-width-x 32
      tool-bar-mode nil
      write-region-inhibit-fsync t
      stack-trace-on-error t
      x-select-enable-clipboard t)

(custom-set-variables
 '(truncate-lines t)
 '(truncate-partial-width-windows nil))

(show-paren-mode 1)

;; (set-face-attribute 'cursor nil :background "grey")
;; (set-face-attribute 'highlight nil :background "gray20" :foreground "#ffffff" :underline nil)
;; (set-face-attribute 'font-lock-warning-face nil :background "black" :foreground "pink" :bold t)
;; (set-face-attribute 'hl-line nil :background "gray20" :foreground "white smoke")
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

(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)
(delete 'try-complete-file-name-partially hippie-expand-try-functions-list)
(delete 'try-complete-file-name hippie-expand-try-functions-list)

(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/bash")   ;; use bash
;; (setq multi-term-program "/bin/zsh") ;; or use zsh...

;; only needed if you use autopair
(add-hook 'term-mode-hook
          #'(lambda () (setq autopair-dont-activate t)))

(setq windmove-wrap-around nil)

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(global-ede-mode t)

;; (server-start)

(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)

(require 'recentf)
 
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
 
;; enable recent files mode.
(recentf-mode t)
 
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
 
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


(require 're-builder)
(setq reb-re-syntax 'string)

(require 'quack)

(provide 'rc-misc)
