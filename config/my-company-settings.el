;;; package -- Summary
;;;
;;; Commentary:
;;;
;;; Provides for company mode
;;;
;;; Code:

(require 'company)
(require 'company-lsp)
(require 'use-package)
(require 'lsp-clangd)

;; LSP settings
(use-package lsp-mode
  :ensure t
  :custom
  (lsp-print-io nil)
  (lsp-trace nil)
  (lsp-print-performance nil)
  (lsp-enable-file-watchers nil)
  (lsp-enable-indentation nil)
  (lsp-prefer-flymake nil)
  :hook (prog-mode . lsp)
  :commands lsp
  )
(use-package lsp-ui
  :ensure t
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u" . lsp-ui-imenu))
  :config
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-symbol t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-update-mode 'point
        lsp-ui-doc-header t
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-flycheck-enable t
        lsp-ui-peek-enable t
        lsp-ui-peek-show-directory t
        lsp-ui-imenu-enable t)
  (setq-default flycheck-disabled-checkers
                                '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :commands
  lsp-ui-mode
  )

;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)


;; Enable tree-sitter
(require 'tree-sitter)
(require 'tree-sitter-langs)

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))

;; Company settings
(use-package company
  :ensure t
  :init (global-company-mode)
  :diminish
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  :bind ( :map company-active-map
                           ("C-n" . company-select-next)
                           ("C-p" . company-select-previous)
                           ))

(use-package company-box
  :ensure
  :hook (company-mode . company-box-mode))

;; Company LSP is no longer supported by lsp-mode.
;;
;;(use-package company-lsp
;;  :config
;;  (push 'company-lsp company-backends)
;;  (setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil))

;; OLD LSP Configuration
;;
;; (use-package lsp-ui)
;
;;(use-package lsp-ui-flycheck
;;  :config
;;  (lsp-ui-flycheck-add-mode 'c++-mode)
;;  (lsp-ui-flycheck-add-mode 'c-mode)
;;  (lsp-ui-flycheck-enable 1))
;;
;; OLD LSP Configuration ends

;; Windows performance tweaks
;;
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))

(provide 'my-company-settings)

;;; my-company-settings.el ends here
