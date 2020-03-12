(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)
(package-install 'paredit)
(package-install 'xcscope)
(package-install 'smex)
(package-install 'helm)
(package-install 'highlight-indentation)
(package-install 'python-mode)
(package-install 'magit)
(package-install 'p4)
(package-install 'markdown-mode)
(package-install 'markdown-mode+)
