(setq org-capture-templates
      '(("t" "Todo" entry (file (concat org-directory "inbox.org"))
         "* TODO %?\n")
        ("T" "Todo with link" entry (file (concat org-directory "inbox.org"))
         "* TODO %?\n  %i\n %a")
        ("a" "Important task" entry (file (concat org-directory "inbox.org"))
         "* TODO [#A] %?\n%t")
        ("j" "Journal" entry (file+datetree (concat org-directory "journal.org"))
         "* %?\n%U\n")))

(add-hook 'org-mode-hook #'(lambda ()
                             (add-hook 'org-agenda-mode-hook #'(lambda ()
                                                                 (define-key org-agenda-mode-map
                                                                   (kbd "w") #'(lambda ()
                                                                                 (interactive)
                                                                                 (org-agenda-write (concat org-directory "export/agenda.txt"))
                                                                                 (org-agenda-write (concat org-directory "export/agenda.html"))))))))


(provide 'rc-org)
