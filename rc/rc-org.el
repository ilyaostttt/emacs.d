(setq org-directory "/media/transcend/org"
      org-default-notes-file (concat org-directory "/notes.org")
      org-log-done 'time
      org-agenda-files (quote ("/media/transcend/org/projects.org"))
      org-global-properties '(("Effort_ALL" . "1:00 2:00 3:00 4:00 5:00 6:00 7:00"))
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-level-color-stars-only t
      org-log-into-drawer "LOGBOOK"
      org-columns-default-format "%25ITEM %TODO %3PRIORITY %7Effort{:} %8CLOCKSUM %TAGS")

(set-face-attribute 'org-hide nil :background "gray14")
(set-face-attribute 'org-level-2 nil :inherit 'outline-3)
(set-face-attribute 'org-level-3 nil :inherit 'outline-6)
(set-face-attribute 'org-level-4 nil :inherit 'outline-5)

(provide 'rc-org)
