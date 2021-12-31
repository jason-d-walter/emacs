
;; Variables
;; Uncomment to enable to trace emacs errors.
; (setq stack-trace-on-error t)
; (setq debug-on-error t)
(setq visible-bell t)
(setq-default column-number-mode t)
(setq-default line-number-mode t)

;; On OSX we want to swap the 'meta key with the command key.
;; maps closer to the Unix and windows way...
;;
(setq mac-command-modifier 'meta)

;; display the system time in the status var.
(display-time)

;; Disable the toolbar.
;;
(tool-bar-mode 0)

;; Turn off the startup screen emacs buffer.
;;
(setq inhibit-startup-message t)
(setq linum-format "%4d \u2502 ")

(setq frame-title-format
      (let ((directoryName
             (directory-file-name
              (file-relative-name
               (my-top-dir)
               (file-name-directory (directory-file-name (my-top-dir)))))))
        (concat "Project -> " directoryName " - %b")))

;; Environment Variables
;
(if (not (string-match "nt" system-configuration))
    (setenv "P4DIFF" "/usr/bin/diff")
  (setenv "P4DIFF" ""))

;; (setenv "PYTHONPATH"
;;   (shell-command-to-string
;;   (concat "python "
;;           (concat (getenv "HOME") "/bin/pythonPaths.py"))))

(if (file-exists-p "/bin/bash")
    (setq explicit-shell-file-name "/bin/bash"))

;; Time Stamping
;;
(setq time-stamp-start "Last Modified:[     ]+\\\\?[\"<]+")
(setq time-stamp-line-limit 16)
(setq time-stamp-format "%3b-%02d-%:y %02H:%02M:%02S")
