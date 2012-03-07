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

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)

(dolist (x '(scheme emacs-lisp lisp clojure))
  (when window-system
    (font-lock-add-keywords
     (intern (concat (symbol-name x) "-mode"))
     '(("(\\|)" . 'esk-paren-face))))
  ;; (add-hook
  ;;  (intern (concat (symbol-name x) "-mode-hook")) 'turn-on-paredit)
  (add-hook
   (intern (concat (symbol-name x) "-mode-hook")) '(lambda ()
                                                     (run-hooks 'coding-hook))))


(provide 'rc-lisp)

