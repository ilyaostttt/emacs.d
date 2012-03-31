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

(global-set-key (kbd "C-c j") 'semantic-ia-fast-jump)
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

(global-set-key (kbd "C-x C-z") 'nil)
(global-set-key (kbd "C-x C-c") 'nil)


(global-set-key (kbd "C-x C-o") 'other-window)
(global-set-key (kbd "C-x O") '(lambda ()
                                 (interactive)
                                 (other-window -1)))

(global-set-key (kbd "C-<f12>") (lambda ()
                                  (interactive)
                                  (save-buffers-kill-terminal t)))

(global-set-key (kbd "C-c S") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c s") 'sr-speedbar-select-window)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))

(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-l") 'windmove-right)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-j") 'windmove-down)


(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term)

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

;; (global-set-key (kbd "C-c E") 'ecb-activate)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(define-key global-map "\C-cc" 'org-capture)

(global-set-key (kbd "C-x C-m") 'anything)

(global-set-key (kbd "<XF86Favorites>") 'bookmark-bmenu-list)
(global-set-key (kbd "<XF86Save>") 'save-buffer)

(global-set-key (kbd "C-c h") 'hs-toggle-hiding)

(global-set-key (kbd "C-c w") '(lambda ()
                                 (interactive)
                                 (woman (current-word))))

;; (global-set-key (kbd "C-c b") 'previous-buffer)

(global-set-key (kbd "<f9>") 'compile)
(global-set-key (kbd "<f10>") 'magit-status)
(global-set-key (kbd "<f7>") 'ecb-activate)
(global-set-key (kbd "<f8>") 'ecb-deactivate)


(provide 'rc-bindings)
