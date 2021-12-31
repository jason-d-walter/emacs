; Paths
(require 'backup-dir)
(setq bkup-backup-directory-info '((t "~/.backups" ok-create full-path)))

;; Specifies backup directory.
;;

;; Do version control on the backup names.
(setq version-control t)
(setq delete-old-versions t)
