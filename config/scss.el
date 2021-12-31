;; SCSS mode support
;
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; Add file extensions and the mode they use

(setq auto-mode-alist
      (append '(("\\.mel$" . c++-mode)
                ("\\.pp$" . ruby-mode)
                ("\\.attr$" . c++-mode)
                ("\\.inl$" . c++-mode)
                ("\\.jam$" . c++-mode)) auto-mode-alist))

