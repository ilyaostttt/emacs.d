(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu nil)
 '(ac-auto-start nil)
 '(ac-trigger-key nil)
 '(ac-use-menu-map t)
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "deep sky blue" "deep sky blue" "#ccaa8f" "#f6f3e8"])
 '(auto-save-default nil)
 '(blink-cursor-mode t)
 '(blink-matching-paren nil)
 '(bm-buffer-persistence t)
 '(bm-highlight-style (quote bm-highlight-only-fringe))
 '(bm-repository-file "/home/ilya/.emacs.d/.bm-repository")
 '(bm-repository-size 200)
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(browse-url-browser-function (quote browse-url-firefox))
 '(c-basic-offset 2)
 '(c-default-style (quote ((c-mode . "k&r") (c++-mode . "k&r") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(c-offsets-alist nil)
 '(compilation-read-command nil)
 '(cua-delete-selection t)
 '(cua-enable-region-auto-help nil)
 '(cua-keep-region-after-copy nil)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "6f09addffc3de43dfac54697af27b8fb98c6ebd75234d43918b469e66056d3ff" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" default)))
 '(default-input-method "russian-computer")
 '(dired-dwim-target t)
 '(dired-omit-extensions (quote (".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".org_archive" ".vrs")))
 '(dired-omit-files "^\\..*$\\|^\\.?#\\|^\\.$\\|^\\.\\.$\\|GPATH\\|GRTAGS\\|GSYMS\\|GTAGS")
 '(dired-recursive-copies (quote always))
 '(ecb-compile-window-height 12)
 '(ecb-layout-name "left9")
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-split-edit-window-after-start nil)
 '(ecb-tip-of-the-day nil)
 '(ecb-toggle-layout-sequence (quote ("mylayout1" "left14")))
 '(ecb-tree-buffer-style (quote image))
 '(ecb-windows-width 0.25)
 '(ede-project-directories (quote ("/home/ilya/src/cpp")))
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(electric-indent-mode nil)
 '(electric-pair-mode nil)
 '(electric-pair-skip-self nil)
 '(gdb-many-windows t)
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(global-semantic-decoration-mode t)
 '(global-semantic-highlight-func-mode t)
 '(global-semantic-idle-completions-mode nil nil (semantic/idle))
 '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic/idle))
 '(global-semantic-idle-scheduler-mode t)
 '(global-semantic-idle-summary-mode t)
 '(global-semanticdb-minor-mode t)
 '(hippie-expand-try-functions-list (quote (try-complete-file-name-partially try-expand-all-abbrevs try-expand-dabbrev try-expand-dabbrev-all-buffers try-complete-lisp-symbol try-expand-dabbrev-from-kill)))
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-max-prospects 10)
 '(ido-mode (quote both) nil (ido))
 '(ido-save-directory-list-file "/home/ilya/.emacs.d/.ido.last")
 '(ido-use-filename-at-point (quote guess))
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(make-backup-files nil)
 '(max-specpdl-size 30000)
 '(mode-require-final-newline nil)
 '(next-screen-context-lines 2)
 '(org-agenda-custom-commands (quote (("n" "week agena + TODO's" ((agenda) (alltodo)) nil ("~/org/tmp.txt")))))
 '(org-agenda-files (quote ("~/Dropbox/org/")))
 '(org-agenda-prefix-format (quote ((agenda . " %i %-12:c%?-12t%s %-8e") (timeline . "  % s") (todo . " %i %-12:c") (tags . " %i %-12:c") (search . " %i %-12:c"))))
 '(org-columns-default-format "\"%25ITEM %TODO %3PRIORITY %7Effort{:} %8CLOCKSUM %TAGS\"")
 '(org-default-notes-file "~/Dropbox/org/projects.org")
 '(org-default-priority 67)
 '(org-directory "~/Dropbox/org/")
 '(org-enforce-todo-dependencies t)
 '(org-export-with-toc nil)
 '(org-fontify-emphasized-text t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-global-properties (quote (("Effort_ALL" . "1:00 2:00 3:00 4:00 5:00 6:00 7:00"))))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-level-color-stars-only nil)
 '(org-log-done (quote time))
 '(org-log-into-drawer "LOGBOOK")
 '(org-mobile-directory "~/Dropbox/mobileorg/")
 '(org-pretty-entities t)
 '(org-pretty-entities-include-sub-superscripts nil)
 '(org-priority-faces (quote ((65 . "LightPink2"))))
 '(org-src-fontify-natively t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(quack-default-program "racket")
 '(recentf-exclude (quote (".*/.gvfs/.*")))
 '(require-final-newline nil)
 '(scroll-bar-mode nil)
 '(semantic-c-dependency-system-include-path (quote ("/usr/include" "/usr/include/c++/4.6")))
 '(semantic-decoration-styles (quote (("semantic-decoration-on-includes" . t) ("semantic-decoration-on-protected-members") ("semantic-decoration-on-private-members") ("semantic-tag-boundary" . t))))
 '(semantic-mode nil)
 '(show-paren-delay 0.025)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(sr-speedbar-skip-other-window-p t)
 '(sr-speedbar-width-x 32)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(truncate-partial-width-windows nil)
 '(yas/also-auto-indent-first-line t)
 '(yas/prompt-functions (quote (yas/dropdown-prompt yas/x-prompt yas/ido-prompt yas/completing-prompt yas/no-prompt)))
 '(yas/trigger-key "s-y")
 '(yas/wrap-around-region t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bm-face ((t (:background "dark slate gray"))))
 '(cursor ((t (:background "yellow green"))))
 '(diff-added ((t (:foreground "dark sea green"))))
 '(diff-changed ((t (:foreground "light coral"))))
 '(diff-removed ((t (:foreground "light coral"))))
 '(ecb-default-highlight-face ((t (:background "SlateBlue4"))))
 '(ecb-history-face ((t (:inherit ecb-default-highlight-face))))
 '(ecb-method-face ((t (:inherit ecb-default-highlight-face))))
 '(ecb-tag-header-face ((t (:background "gray26"))))
 '(font-lock-warning-face ((t (:background "black" :foreground "pink" :bold t))))
 '(helm-selection ((((background dark)) (:background "dark olive green" :foreground "white" :underline nil)) (((background light)) (:background "#b5ffd1" :underline nil))))
 '(highlight ((t (:background "slate gray" :underline nil))))
 '(hl-line ((t (:background "black"))))
 '(ido-only-match ((t (:foreground "medium spring green"))))
 '(ido-subdir ((t (:foreground "cornflower blue"))))
 '(isearch ((t (:background "light goldenrod yellow" :foreground "black"))))
 '(lazy-highlight ((t (:background "khaki" :foreground "black"))))
 '(magit-header ((t (:inherit header-line :underline t))))
 '(magit-item-highlight ((t (:inherit highlight))))
 '(org-block ((t (:inherit shadow))))
 '(org-block-background ((t (:background "black"))))
 '(org-column ((t (:background "dark slate gray" :strike-through nil :underline nil :slant normal :weight normal :height 110 :family "Consolas"))))
 '(org-drawer ((t (:foreground "dim gray"))))
 '(org-hide ((t (:foreground "gray14"))))
 '(org-level-1 ((t (:foreground "powder blue" :weight bold :height 1.0))))
 '(org-level-2 ((t (:foreground "LightYellow1" :weight bold))))
 '(org-level-3 ((t (:foreground "peach puff" :weight bold))))
 '(org-level-4 ((t nil)))
 '(org-level-5 ((t nil)))
 '(org-level-6 ((t nil)))
 '(org-level-7 ((t nil)))
 '(org-level-8 ((t nil)))
 '(org-link ((t nil)))
 '(org-meta-line ((t nil)))
 '(region ((t (:background "dark slate blue"))))
 '(semantic-decoration-on-includes ((t nil)) t)
 '(semantic-decoration-on-unparsed-includes ((t (:background "purple4"))))
 '(semantic-highlight-func-current-tag-face ((t (:background "gray8"))))
 '(semantic-tag-boundary-face ((t (:overline "dim gray"))))
 '(show-paren-match ((t (:background "gray14" :foreground "steelblue3")))))
