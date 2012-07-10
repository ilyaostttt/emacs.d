(require 'ecb)

(setq ecb-layout-name "mylayout1"
      ecb-layout-window-sizes nil
      ecb-tip-of-the-day nil
      ecb-windows-width 0.20)

(set-face-attribute 'ecb-default-highlight-face nil :background "SlateBlue4")
(set-face-attribute 'ecb-history-face nil :inherit 'ecb-default-highlight-face)
(set-face-attribute 'ecb-method-face nil :inherit 'ecb-default-highlight-face)
(set-face-attribute 'ecb-tag-header-face nil :inherit 'ecb-default-highlight-face)

(setq ecb-source-path (quote (("/home/ilya/src/" "src"))))

(provide 'rc-ecb)
