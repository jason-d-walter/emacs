;; obj-c mode
;;
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))

;; If a header file includes interface keyword then switch to objc-mode
(add-to-list 'magic-mode-alist
                `(,(lambda ()
                     (and (string= (file-name-extension buffer-file-name) "h")
                          (re-search-forward "@\\<interface\\>"
                         magic-mode-regexp-match-limit t)))
                  . objc-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . objc-mode))
