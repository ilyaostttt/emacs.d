(global-set-key (kbd "M-%" ) 'query-replace-regexp)
(global-set-key (kbd "C-M-h" ) 'backward-kill-word)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-?") 'ac-start)
(global-set-key (kbd "C-z") 'undo)
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
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c v") 'visit-tags-table)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-c e") 'eshell)

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-c s") 'org-time-stamp)
	    ))

(global-set-key (kbd "C-x C-z") 'nil)
(global-set-key (kbd "C-x C-c") 'nil)

(global-set-key (kbd "C-x C-o") 'other-window)

(global-set-key (kbd "<f12>") (lambda ()
				(interactive)
				(save-buffers-kill-terminal t)))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "<XF86Favorites>") 'bookmark-bmenu-list)

(global-set-key (kbd "<f10>") 'magit-status)

;;;;;;;;;;;;;;;;;;; helm
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c m") 'helm-bookmarks)
(global-set-key (kbd "C-c o") 'helm-occur)

(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-c C-f") 'helm-find-files)
;;;;;;;;;;;;;;;;;;;

;; accidentally hit set-goal-column when actually trying to narrow buffer
(global-set-key (kbd "C-x C-n") 'nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (local-set-key (kbd "M-u") 'dired-up-directory)
            ))

(global-set-key (kbd "M-n") '(lambda ()
			       (interactive)
			       (scroll-up-command 3)))

(global-set-key (kbd "M-p") '(lambda ()
			       (interactive)
			       (scroll-down-command 3)))

(provide 'rc-bindings)
