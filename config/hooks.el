;;; package -- Summary
;;; Commentary:
;;; Code:

(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'smartparens-config)
(require 'pshell)

(defun my-apply-spacing ()
  "Apply old way of setting tab / space settings."
  (let ((tab-settings (my-tab-settings)))
    (let ( (is-tab (if (string= (car tab-settings) "tab")
                       't nil))
           (spacing (string-to-number (car (last tab-settings)))))
      (defvar c-basic-indent spacing)
      (defvar c-basic-offset spacing)

      (defvar js-indent-level spacing)
      (defvar ruby-indent-level spacing)
      (defvar web-mode-code-indent-offset spacing)
      (defvar web-mode-css-indent-offset spacing)
      (defvar web-mode-markup-indent-offset spacing)
      (defvar tab-width spacing)
      (defvar python-indent spacing)
      (defvar default-tab-width spacing)
      (defvar sgml-basic-offset spacing)
      (defvar lua-indent-level spacing)
      (defvar css-indent-offset spacing)
      (setq indent-tabs-mode is-tab)
      )))

(defun standard-hook()
  "Apply a standard set of mode hooks."
  (if (my-has-editorconfig)
      (editorconfig-mode 1)
    (my-apply-spacing))
  (if indent-tabs-mode
      (my-buffer-whitespace '("tab"))
    (my-buffer-whitespace '("space"))
    )
  (rainbow-delimiters-mode)
  (smartparens-mode)
  )

(add-hook 'protobuf-mode-hook 'standard-hook)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(require 'time-stamp)
(defun my-html-hook()
  "Hook for HTML editing."
  (font-lock-mode)
  (standard-hook)
  (setq time-stamp-start "Last Modified:[   ]+\\\\?<i>+")
  (setq time-stamp-end   "\\\\?<\/i>")
  (setq time-stamp-line-limit -16)
  (setq time-stamp-format "%3b-%02d-%:y %02H:%02M:%02S"))

(add-hook 'conf-mode-hook
          'standard-hook)

(add-hook 'cmake-mode-hook 'standard-hook)

(add-hook 'json-mode-hook 'standard-hook)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(defun my-c-hook ()
  "Hook for c and c++ editing."
  (font-lock-mode)
  (c-set-style "stroustrup")
  (c-set-offset 'innamespace 0)

  (standard-hook)
  (company-mode)
  (subword-mode)
  (yas-minor-mode)
  (lsp)
  (flycheck-mode))

(add-hook 'csharp-mode
          (lambda ()
            (omnisharp-mode)
            (company-mode)
            (flycheck-mode)
            (standard-hook)))

(add-hook 'csharp-mode-hook
          (lambda ()
            (omnisharp-mode)
            (company-mode)
            (flycheck-mode)
            (standard-hook)))

(add-hook 'css-mode
          (lambda ()
            (standard-hook)))

(add-hook 'scss-mode
          (lambda ()
            (standard-hook)))

;; System Hooks
(add-hook 'json-mode
          (lambda ()
            (flycheck-mode)
            (standard-hook)))

(add-hook 'conf-mode-hook 'standard-hook)

(add-hook 'write-file-functions
          '(lambda () (time-stamp)))

(add-hook 'c-mode-hook 'my-c-hook)
(add-hook 'c++-mode-hook 'my-c-hook)
(add-hook 'ruby-mode-hook 'my-c-hook)

(add-hook
 'emacs-lisp-mode-hook
 (lambda ()
   (standard-hook)))

(defun python-hook-handler ()
  "My hook handler for python."
   (font-lock-mode)
   (defvar python-guess-indent nil)
   (standard-hook))

(add-hook
 'python-mode-hook
 (lambda ()
   (python-hook-handler)))

(add-hook 'latex-mode-hook
  '(lambda ()
     (standard-hook)
     (font-lock-mode)))

(add-hook 'sass-mode-hook
      '(lambda ()
         (standard-hook)
         (font-lock-mode)))

(add-hook 'perl-mode-hook
      '(lambda ()
         (standard-hook)
         (font-lock-mode)))

(add-hook 'lisp-mode-hook
      '(lambda ()
         (standard-hook)
         (font-lock-mode)))

(add-hook 'text-mode-hook
      '(lambda ()
         (auto-fill-mode)
         (standard-hook)
         ;; The following line forces text-mode to always use tab insert function which
         ;; then should reflect the settings above.
         ;; See:
         ;; https://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
;;         (setq indent-line-function 'insert-tab)
         ))

(add-hook 'web-mode-hook
      '(lambda ()
         (standard-hook)
         (font-lock-mode)
         (if (equal web-mode-content-type "javascript")
             (web-mode-set-content-type "jsx")
           (message "now set to: %s" web-mode-content-type))))

(add-hook 'objc-mode-hook
      '(lambda ()
         (standard-hook)
         (font-lock-mode)))

(add-hook 'lua-mode-hook
      '(lambda ()
         (standard-hook)
         (font-lock-mode)))

(add-hook 'html-mode-hook 'my-html-hook)
