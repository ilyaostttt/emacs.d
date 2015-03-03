(global-set-key (kbd "M-%" ) 'query-replace-regexp)
(global-set-key (kbd "C-M-h" ) 'backward-kill-word)
(global-set-key (kbd "M-/"   ) 'hippie-expand)
(global-set-key (kbd "C-z"   ) 'undo)
(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key (kbd "C-x C-k RET") 'ido-kill-buffer)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;;;;;;;;;;;;;;;;; isearch
(global-set-key (kbd "C-s"   ) 'isearch-forward-regexp)
(global-set-key (kbd "\C-r"  ) 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s" ) 'isearch-forward-word)
(global-set-key (kbd "C-M-r" ) 'isearch-backward)
;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;;;;;;;;;;;;;;;;; C-c
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c p") (lambda ()
                                (interactive)
                                (revert-buffer-with-coding-system 'cp866)))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-c b") 'beginning-of-defun)
(global-set-key (kbd "C-c e") 'end-of-defun)
(global-set-key (kbd "C-c t") 'shell)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)
(global-set-key (kbd "C-c w") '(lambda ()
                                 (interactive)
                                 (woman (current-word))))

;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x m") 'eshell)

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-c o s") 'org-time-stamp)
            (define-key org-mode-map (kbd "C-c o m") 'org-insert-heading-respect-content)
            (define-key org-mode-map (kbd "C-c o p") 'org-priority)))

(global-set-key (kbd "C-x C-z") 'nil)
(global-set-key (kbd "C-x C-c") 'nil)

(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x O") '(lambda ()
                                 (interactive)
                                 (other-window -1)))

(global-set-key (kbd "<f12>") (lambda ()
                                  (interactive)
                                  (save-buffers-kill-terminal t)))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))

(global-set-key (kbd "M-#") 'er/expand-region)

(fset 'mark-line
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 67108896 5] 0 "%d")) arg)))

(global-set-key (kbd "C-/") 'mark-line)
(global-set-key (kbd "M-#") 'er/expand-region)

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


(global-set-key (kbd "<XF86Favorites>") 'bookmark-bmenu-list)
(global-set-key (kbd "<XF86Save>") 'save-buffer)

;;;;;;;;;;;;;; gdb
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'gdb)
(global-set-key (kbd "<f7>") 'gud-step)
(global-set-key (kbd "<f8>") 'gud-next)

(define-prefix-command 'mygdb-map)
(global-set-key (kbd "C-c g") 'mygdb-map)
(global-set-key (kbd "C-c g g") 'gdb)
(global-set-key (kbd "C-c g b") 'gud-break)
;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "<f10>") 'magit-status)


;;;;;;;;;;;;;;;;;;; helm
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c m") 'helm-bookmarks)
(global-set-key (kbd "C-c o") 'helm-occur)

(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-f") 'helm-find-files)
;;;;;;;;;;;;;;;;;;;


;; accidentally hit set-goal-column when actually trying to narrow buffer (usually to defun)
(global-set-key (kbd "C-x C-n") 'narrow-to-defun)


;; get rid of `find-file-read-only' and replace it with something more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(global-set-key (kbd "s-;") '(lambda ()
                               (interactive)
                               (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(add-hook 'dired-mode-hook
          (lambda ()
            (local-set-key (kbd "f") 'find-dired)
            (local-set-key (kbd "e") 'find-grep)
            (local-set-key (kbd "M-u") 'dired-up-directory)
            ))

;;;;;;;;;;;;;;;; hs
(defvar hs-all-hidden nil)

(add-hook 'hs-hide-hook '(lambda ()
                          (setq hs-all-hidden t)))

(add-hook 'hs-show-hook '(lambda ()
                          (setq hs-all-hidden nil)))

(global-set-key (kbd "M-n") '(lambda ()
			       (interactive)
			       (scroll-up-command 3)))

(global-set-key (kbd "M-p") '(lambda ()
			       (interactive)
			       (scroll-down-command 3)))

(provide 'rc-bindings)
