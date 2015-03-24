(require 'org)

(setq org-capture-templates
      '(("t" "Todo" entry (file (concat org-directory "inbox.org"))
         "* TODO %?\n")
        ("T" "Todo with link" entry (file (concat org-directory "inbox.org"))
         "* TODO %?\n  %i\n %a")
        ("a" "Important task" entry (file (concat org-directory "inbox.org"))
         "* TODO [#A] %?\n%t")
        ("j" "Journal" entry (file+datetree (concat org-directory "journal.org"))
         "* %?\n%U\n")))

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "|" "DONE" "CANCELLED")))

(setq org-directory "~/notes")
(setq org-agenda-files `(,org-directory))
(setq org-default-notes-file (concat org-directory "/inbox.org"))

(provide 'rc-org)
