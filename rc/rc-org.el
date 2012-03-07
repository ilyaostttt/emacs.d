(setq org-directory "/media/transcend/org")

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done 'time)

(provide 'rc-org)
