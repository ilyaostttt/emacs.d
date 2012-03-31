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
