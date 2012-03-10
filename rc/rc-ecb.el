(require 'ecb)

(setq ecb-layout-name "left1"
      ecb-layout-window-sizes nil
      ecb-options-version "2.40"
      ecb-tip-of-the-day nil
      ecb-windows-width 0.25)

(set-face-attribute 'ecb-default-highlight-face nil :background "SlateBlue4")
(set-face-attribute 'ecb-history-face nil :inherit 'ecb-default-highlight-face)
(set-face-attribute 'ecb-method-face nil :inherit 'ecb-default-highlight-face)
(set-face-attribute 'ecb-tag-header-face nil :inherit 'ecb-default-highlight-face)


(provide 'rc-ecb)
