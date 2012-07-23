(define-key lisp-mode-shared-map (kbd "C-c l") "lambda")
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

(defface esk-paren-face
  '((((class color) (background dark))
     (:foreground "grey50"))
    (((class color) (background light))
     (:foreground "grey55")))
  "Face used to dim parentheses."
  :group 'starter-kit-faces)

(dolist (x '(scheme emacs-lisp lisp clojure))
  (when window-system
    (font-lock-add-keywords
     (intern (concat (symbol-name x) "-mode"))
     '(("(\\|)" . 'esk-paren-face))))
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) '(lambda ()
                                                     (require 'paredit)
                                                     (enable-paredit-mode)
                                                     (run-hooks 'coding-hook))))

(provide 'rc-lisp)
