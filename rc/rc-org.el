(setq org-directory "/media/transcend/org/"
      org-default-notes-file (concat org-directory "projects.org")
      org-agenda-files `(,org-default-notes-file)
      org-log-done 'time
      org-global-properties '(("Effort_ALL" . "1:00 2:00 3:00 4:00 5:00 6:00 7:00"))
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-level-color-stars-only t
      org-log-into-drawer "LOGBOOK"
      org-columns-default-format "%25ITEM %TODO %3PRIORITY %7Effort{:} %8CLOCKSUM %TAGS"
      org-enforce-todo-dependencies t
      org-agenda-dim-blocked-tasks t)

(add-hook 'org-mode-hook (lambda ()
                           (set-face-attribute 'org-hide nil :background "grey14" :foreground "grey14")
                           (set-face-attribute 'org-level-2 nil :inherit 'outline-3)
                           (set-face-attribute 'org-level-3 nil :inherit 'outline-6)
                           (set-face-attribute 'org-level-4 nil :inherit 'outline-5)))



(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "projects.org") "Tasks")
         "* TODO %?\n")
        ("T" "Todo with link" entry (file+headline (concat org-directory "projects.org") "Tasks")
         "* TODO %?\n  %i\n %a")
        ("a" "Important task" entry (file+headline (concat org-directory "projects.org") "Tasks")
         "* TODO [#A] %?\n%t")
        ("j" "Journal" entry (file+datetree (concat org-directory "journal.org"))
         "* %?\n%U\n")))

(provide 'rc-org)
