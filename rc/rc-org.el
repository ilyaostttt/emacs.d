(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "projects.org") "Tasks")
         "* TODO %?\n")
        ("T" "Todo with link" entry (file+headline (concat org-directory "projects.org") "Tasks")
         "* TODO %?\n  %i\n %a")
        ("a" "Important task" entry (file+headline (concat org-directory "projects.org") "Tasks")
         "* TODO [#A] %?\n%t")
        ("j" "Journal" entry (file+datetree (concat org-directory "journal.org"))
         "* %?\n%U\n")))

(defun my-org-mobile-push ()
  "Push the current state of Org affairs to the WebDAV directory.
This will create the index file, copy all agenda files there, and also
create all custom agenda views, for upload to the mobile phone."
  (interactive)
  (let ((a-buffer (get-buffer org-agenda-buffer-name)))
    (let ((org-agenda-buffer-name "*SUMO*")
	  (org-agenda-tag-filter org-agenda-tag-filter)
	  (org-agenda-redo-command org-agenda-redo-command))
      (save-excursion
	(save-window-excursion
	  (run-hooks 'org-mobile-pre-push-hook)
	  (org-mobile-check-setup)
	  (org-mobile-prepare-file-lists)
	  (let ((inhibit-redisplay t)) (org-mobile-create-sumo-agenda))
	  (org-save-all-org-buffers) ; to save any IDs created by this process
	  (org-mobile-copy-agenda-files)
	  (org-mobile-create-index-file)
	  (org-mobile-write-checksums)
	  (run-hooks 'org-mobile-post-push-hook))))
    (when (and a-buffer (buffer-live-p a-buffer))
      (if (not (get-buffer-window a-buffer))
	  (kill-buffer a-buffer)
	(let ((cw (selected-window)))
	  (select-window (get-buffer-window a-buffer))
	  (org-agenda-redo)
	  (select-window cw))))))

(run-at-time "5 min" 300 '(lambda ()
                           (run-with-idle-timer 30 nil 'my-org-mobile-push)))

;; (run-at-time "10 min" 600 '(lambda ()
;;                            (run-with-idle-timer 180 nil 'org-mobile-push)))

(provide 'rc-org)
