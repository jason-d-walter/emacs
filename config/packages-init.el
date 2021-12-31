;;; package -- Summary
;;;
;;; Commentary:
;;; Initializes the packages I most commonly use.
;;;
;;;
;;; Code:
;;
(require 'package)

;; list the packages you want
(defvar package-list
  '(
    ;; helm
    ;; helm-projectile
    ;; helm-purpose
    ;; helm-projectile
    ;; helm-lsp
    use-package

    projectile
    projectile-ripgrep

    ivy
    counsel-projectile
    counsel-codesearch
    ivy-hydra
    posframe
    ivy-posframe
    prescient
    ivy-prescient
    company-prescient

    flycheck
    flycheck-rust
    js2-mode
    json-mode
    rust-mode

    p4

    ;; Used for controlling editor settings
    ;; spacing, etc.
    ;;
    editorconfig

    window-purpose
    find-file-in-repository

    rainbow-delimiters
    company-lsp
    deadgrep

    ;; Magit
    ;;
    magit
    git-commit
    git-timemachine
    magit-find-file
    magit-filenotify

    all-the-icons
    all-the-icons-dired
    ;; org add ons
    ;;
    org-jira
    org-bullets

    ;;;
    yasnippet
    yasnippet-snippets

    ;;;;
    smartparens

    ;; C-sharp support
    ;;
    omnisharp

    ;; Mode line customization
    ;;
    all-the-icons
    doom-modeline
    doom-themes

    ;; See https://github.com/yjwen/org-reveal for configuration.
    ;; Need to define ORG_MODE_OX_REVEALJS to the location of
    ;; reveal.js install.
    ;;
    ;; ox-reveal
    spacemacs-theme
    protobuf-mode
    clang-format
    htmlize

    ;;
    dap-mode

    ;; lsp stuff
    lsp-mode
    lsp-ui
    treemacs
    lsp-treemacs
    lsp-python-ms

    tree-sitter
    tree-sitter-langs

    unicode-fonts
    company-box
    ccls

    multiple-cursors
    expand-region
    web-mode))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'package-init)
;;; packages-init ends here
