;;; Package --- Summary
;;; Commentary:
;;; Code:

;; Look and feel
;;
;; My own copies of specific libraries + custom libraries.
;;

;; Speed up loading
;;
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;;(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold 800000)))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defun homePath (path)
  (concat (getenv "HOME") path))

(unless (not (file-exists-p (homePath "/.flycheck")))
  (make-directory (homePath "/.flychecks")))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix (homePath "/.flychecks/_flycheck"))

(setq load-path (cons (homePath "/.emacs.d/lisp") load-path))
(setq load-path (cons (homePath "/elisp") load-path))

(load (homePath "/.emacs.d/load-directory"))
(load (homePath "/.emacs.d/config/packages-init"))
(load-directory (homePath "/.emacs.d/config"))

(setq exec-path (append exec-path '("C:\\Program Files\\LLVM\\bin")))

;; Run our default hook
(standard-hook)

;; Always save the desktop layout
;;
;; (desktop-save-mode 1)

;;
;; Enable windmove bindings
;;
;; S-<LEFT> move to the window on the left
;; S-<RIGHT> move to the window on the right
;; S-<DOWN> move to the window below
;; S-<UP> move to the window above.
;;
(windmove-default-keybindings)


;; Speed up line movement.
;;
(setq auto-window-vscroll nil)

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

(load-theme 'doom-one t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(load-home-init-file t t)
 '(ff-search-directories
   '("." "../Public/*" "../Private/*" "../../Public/*" "../../Private/*" "../Classes/*") t)
 '(flycheck-standard-error-navigation nil)
 '(lsp-clients-clangd-args '("--log=error"))
 '(lsp-enable-on-type-formatting nil)
 '(lsp-idle-delay 0.5)
 '(lsp-rust-rls-server-command '("rust-analyzer"))
 '(lsp-ui-doc-position 'top)
 '(package-selected-packages
   (quote
	(web-mode spacemacs-theme smartparens rust-mode rainbow-delimiters protobuf-mode org-jira omnisharp multiple-cursors magit lsp-ui js2-mode jedi htmlize flycheck-rust expand-region deadgrep company-lsp clang-format))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
