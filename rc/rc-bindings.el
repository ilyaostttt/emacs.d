;; (global-set-key (kbd "M-f" ) 'forward-word)
;; (global-set-key (kbd "M-b" ) 'backward-word)

(global-set-key (kbd "C-v" ) '(lambda ()
                                (interactive)
                                (scroll-up-command 1)))

(global-set-key (kbd "M-v" ) '(lambda ()
                                (interactive)
                                (scroll-down-command 1)))

(global-set-key (kbd "M-%" ) 'query-replace-regexp)
(global-set-key (kbd "C-M-h" ) 'backward-kill-word)
(global-set-key (kbd "M-/"   ) 'hippie-expand)
(global-set-key (kbd "C-z"   ) 'undo)
;; (global-set-key (kbd "C-S-z" ) 'undo-tree-undo)
;; (global-set-key (kbd "C-x C-k") 'ido-kill-buffer)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s"   ) 'isearch-forward-regexp)
(global-set-key (kbd "\C-r"  ) 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s" ) 'isearch-forward)
(global-set-key (kbd "C-M-r" ) 'isearch-backward)

(global-set-key (kbd "C-c C-j") 'semantic-ia-fast-jump)
(global-set-key (kbd "C-c C-n") 'senator-next-tag)
(global-set-key (kbd "C-c C-p") 'senator-previous-tag)

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c p") (lambda ()
                                (interactive)
                                (revert-buffer-with-coding-system 'cp866)))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x m") 'eshell)

(global-set-key (kbd "C-c q") 'join-line)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(define-key org-mode-map (kbd "C-c o s") 'org-time-stamp)
(define-key org-mode-map (kbd "C-c o m") 'org-insert-heading-respect-content)
(define-key org-mode-map (kbd "C-c o p") 'org-priority)

(global-set-key (kbd "C-x C-z") 'nil)
(global-set-key (kbd "C-x C-c") 'nil)


(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x O") '(lambda ()
                                 (interactive)
                                 (other-window -1)))

(global-set-key (kbd "C-<f12>") (lambda ()
                                  (interactive)
                                  (save-buffers-kill-terminal t)))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))

(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <left>") 'windmove-left)

(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-O") '(lambda ()
                                 (interactive)
                                 (other-window -1)))

(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term)
(global-set-key (kbd "C-c s") 'shell)

(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)

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
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)



(global-set-key (kbd "C-x C-m") 'anything)

(global-set-key (kbd "<XF86Favorites>") 'bookmark-bmenu-list)
(global-set-key (kbd "<XF86Save>") 'save-buffer)

(global-set-key (kbd "C-c h") 'hs-toggle-hiding)

(global-set-key (kbd "C-c w") '(lambda ()
                                 (interactive)
                                 (woman (current-word))))

;; (global-set-key (kbd "C-c b") 'previous-buffer)

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'gdb)

(define-prefix-command 'mygdb-map)
(global-set-key (kbd "C-c g") 'mygdb-map)
(global-set-key (kbd "C-c g g") 'gdb)
(global-set-key (kbd "C-c g b") 'gud-break)

(global-set-key (kbd "<f10>") 'magit-status)

(define-prefix-command 'myecb-map)
(define-key global-map (kbd "C-c e") 'myecb-map)
(global-set-key (kbd "C-c e a") 'ecb-activate)
(global-set-key (kbd "C-c e d") 'ecb-deactivate)
(global-set-key (kbd "C-c e t") 'ecb-toggle-ecb-windows)


(define-prefix-command 'bm-map)
(global-set-key (kbd "C-c b") 'bm-map)
(global-set-key (kbd "C-c m") 'bm-map)

(define-key 'bm-map (kbd "n") 'bm-next)
(define-key 'bm-map (kbd "p") 'bm-prev)
(define-key 'bm-map (kbd "t") 'bm-toggle)
(define-key 'bm-map (kbd "b") 'bm-toggle)
(define-key 'bm-map (kbd "m") 'bm-toggle)
(define-key 'bm-map (kbd "s") 'bm-show)
(define-key 'bm-map (kbd "l") 'bm-show)
(define-key 'bm-map (kbd "S") 'bm-show-all)
(define-key 'bm-map (kbd "L") 'bm-show-all)
(define-key 'bm-map (kbd "a") 'bm-bookmark-annotate)

;; accidentally hit set-goal-column when actually trying to narrow buffer (usually to defun)
(global-set-key (kbd "C-x C-n") 'narrow-to-defun)

(provide 'rc-bindings)
 
