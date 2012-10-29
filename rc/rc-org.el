(require 'org)
(require 'org-mobile)

(setq org-capture-templates
      '(("t" "Todo" entry (file (concat org-directory "inbox.org"))
         "* TODO %?\n")
        ("T" "Todo with link" entry (file (concat org-directory "inbox.org"))
         "* TODO %?\n  %i\n %a")
        ("a" "Important task" entry (file (concat org-directory "inbox.org"))
         "* TODO [#A] %?\n%t")
        ("j" "Journal" entry (file+datetree (concat org-directory "journal.org"))
         "* %?\n%U\n")))

(defun my-org-write ()
  (interactive)
  (org-save-all-org-buffers)
  (org-agenda-write (concat org-directory "export/agenda.html"))
  (org-mobile-push)
  (kill-buffer "*Org Agenda*")
  (kill-buffer "*SUMO*")
  )

;; (add-hook 'org-mode-hook #'(lambda ()
;;                              (add-hook 'org-agenda-mode-hook #'(lambda ()
;;                                                                  (define-key org-agenda-mode-map
;;                                                                    (kbd "w") 'my-org-write)))))


(define-key org-agenda-mode-map (kbd "w") 'my-org-write)
(define-key org-agenda-mode-map (kbd "l") 'org-mobile-pull)

(provide 'rc-org)
