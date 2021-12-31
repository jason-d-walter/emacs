;;; package --- csharp.el
;;; Commentary:
;;;
;;; Code:
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode ))

(require 'company)

(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

(require 'omnisharp)

(provide 'csharp)
;;; csharp.el ends here
