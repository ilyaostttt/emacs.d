;;;###autoload
(defun goldendict-history-export ()
  (interactive)
  (with-current-buffer (find-file-noselect "~/Documents/ankiimport.txt")
    (goto-char (point-max))
    (when (not (bolp))
      (insert-char ?\n))
    (insert-file-contents "~/.goldendict/history")
    (while (not (eobp))
      (forward-word)
      (delete-region (line-beginning-position) (point))
      (delete-horizontal-space)
      (forward-line))
    (save-buffer)))

