(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

(dolist (x '(scheme emacs-lisp lisp clojure))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) '(lambda ()
                                                     (require 'paredit)
                                                     (enable-paredit-mode))))

(provide 'lisp)
