;;; package -- Summary
;;;
;;; Commentary:
;;;
;;; Provides settings for windows-purpose
;;;
;;; Code:

(require 'window-purpose)
;; (require 'helm-purpose)

(add-to-list 'purpose-user-mode-purposes '(python-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(json-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(c-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(c++-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(ruby-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(web-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(objc-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(lua-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(perl-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(text-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(html-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(css-mode . edit))
(add-to-list 'purpose-user-mode-purposes '(compilation-mode . compile))
(add-to-list 'purpose-user-regexp-purposes '("^\*APP\*:.*"  . terminal))

(purpose-compile-user-configuration)

;; purpose extensions.
(require 'window-purpose-x)

(purpose-mode)

(provide 'my-purpose-settings)

;;; my-purpose-settings ends here
