;; Init file for magit.
;;

(if (eq system-type 'windows-nt)
    (let ((path1 "C:/Program Files/Git/cmd/git.exe")
          (path2 "C:/Program Files/Autodesk Git Bundle/cmd/git.exe"))
      (if (file-exists-p path1)
          (setq magit-git-executable path1)
        (setq magit-git-executable path2))))

(use-package git-commit)
;; (use-package forge
;;   :after magit)
(use-package magit
  ;; Make the default action a branch checkout, not a branch visit when in branch mode
  :bind (:map magit-branch-section-map
              ([remap magit-visit-thing] . magit-branch-checkout)))
(use-package magit-filenotify)
(use-package magit-find-file)
(use-package git-timemachine)
