(setq c-default-style '((c-mode . "awk")
                        (c++-mode . "awk")
                        (java-mode . "java")
                        (awk-mode . "awk")
                        (other . "gnu")))

(add-hook 'gtags-mode-hook
          (lambda()
            (local-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
            (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag


(add-hook 'c-mode-common-hook (lambda ()
                                (add-watchwords)
                                (electric-pair-mode)
                                (hs-minor-mode)
                                (gtags-mode t)
                                ;; (local-set-key (kbd "C-c b") 'semantic-mrub-switch-tags)
                                ))

(require 'semantic/bovine/c)
(require 'semantic/symref)

(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/home/ilya/src/def.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file "/usr/include/i386-linux-gnu/sys/cdefs.h")

(semantic-c-add-preprocessor-symbol "__USE_XOPEN" "1")
(semantic-c-add-preprocessor-symbol "__USE_POSIX" "1")
(semantic-c-add-preprocessor-symbol "__USE_GNU" "1")
(semantic-c-add-preprocessor-symbol "__USE_BSD" "1")
(semantic-c-add-preprocessor-symbol "__nonnull" "")
(semantic-c-add-preprocessor-symbol "__USE_POSIX199309" "")

(provide 'rc-c-mode)
