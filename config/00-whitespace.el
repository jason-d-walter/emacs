;;; package -- Summary
;;; Commentary:
;;; Code:
;; Setup to use blank mode
(require 'whitespace)

(defun my-buffer-whitespace (space-or-tab)
  (let ()
    (if (string= (car space-or-tab) "space")
        (setq whitespace-style (quote (face lines trailing tabs newline tab-mark)))
      (setq whitespace-style (quote (face lines trailing space newline space-mark))))
    (setq-default whitespace-line-column 180)
    (whitespace-mode 1)))

(global-whitespace-mode 1)

