;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons)

(provide 'my-doom-settings)

;;; my-doom-settings ends here
