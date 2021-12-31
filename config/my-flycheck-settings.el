;;; package -- summary
;;; Commentary:
;;; Code:

(require 'use-package)

(use-package flycheck
  :config
  (global-flycheck-mode)
  :ensure t :diminish)

(provide 'my-flychecksettings.el)

;;; my-flycheck-settings ends here
