;;; package -- Summary
;;;
;;; Commentary:
;;;
;;; Provides settings for irony-mode
;;;
;;; Code:

;;; (require 'ox-reveal)

;;; (when (getenv "ORG_MODE_OX_REVEALJS")
;;;  (setq org-reveal-root
;;;        (concat "file:///"
;;;                (replace-regexp-in-string "\\\\" "/"
;;;                                          (getenv "ORG_MODE_OX_REVEALJS")))))

(require 'org-jira)
(require 'org)
(require 'org-capture)

(setq jiralib-url "https://jira.autodesk.com")

(defun my-org-mode-dir ()
  "Get the directory for org mode files."
  (if (getenv "ORG_MODE_DIR")
      (getenv "ORG_MODE_DIR")
    (concat (getenv "HOME") "/" "org")))

(unless (file-exists-p (my-org-mode-dir))
  (make-directory (my-org-mode-dir)))

(defun my-org-path (filename)
     "Get the path to the org FILENAME."
     (let ((fname (if (string-match "\.org\\'" filename)
                      filename
                    (concat filename ".org"))))
       (concat (file-name-as-directory (my-org-mode-dir)) fname)))

(setq org-jira-working-dir (my-org-mode-dir))

(defun jira-org-file ()
  "Get the jira org file based on the current project."
  (if (getenv "JIRA_PROJECT_NAME")
      (my-org-path (getenv "JIRA_PROJECT_NAME"))))

(setq org-agenda-files (list (my-org-path "inbox.org")
                             (my-org-path "refile-beorg.org")
                             (my-org-path "gtd.org")
                             (my-org-path "tickler.org")
                             (jira-org-file)))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline (my-org-path "inbox.org") "Tasks")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline (my-org-path "tickler.org") "Tickler")
                               "* %i%? \n %U")))

;; Uncomment to enable jira refresh on load.
;;
;;(if (getenv "JIRA_PROJECT_NAME")
;;    (org-jira-get-issues
;;     (org-jira-get-issue-list org-jira-get-issue-list-callback)))

(defun my-open-org (filename)
  "Open a org FILENAME based on org mode dir."
    (find-file (my-org-path filename)))

(defun my-org-open-file (filename)
  "Org mode open a FILENAME."
  (interactive  "sOrg file: ")
  (my-open-org filename))

(defun my-file-name-extension (filename &optional period)
  "Return FILENAME's final \"extension\".
The extension, in a file name, is the part that begins with the last `.',
excluding version numbers and backup suffixes, except that a leading `.'
of the file name, if there is one, doesn't count.
Return the empty string for file names such as `foo.' or `foo'.

By default, the returned value excludes the period that starts the
extension, but if the optional argument PERIOD is non-nil, the period
is included in the value, and in that case, if FILENAME has no
extension, the value is \"\"."
  (if filename
      (save-match-data
        (let ((file (file-name-sans-versions (file-name-nondirectory filename))))
          (if (and (string-match "\\.[^.]*\\'" file)
                   (not (eq 0 (match-beginning 0))))
              (substring file (+ (match-beginning 0) (if period 0 1)))
            (if period ""))))
    ""))


(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(provide 'my-org-setup)

;;; my-org-setup ends here
