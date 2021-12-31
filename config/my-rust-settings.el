;;; package --- Configuration settings for rust
;;;
;;; Commentary:
;;;
;;; Code:
(require 'flycheck-rust)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(provide 'my-rust-settings.el)
;;; my-rust-settings.el ends here
