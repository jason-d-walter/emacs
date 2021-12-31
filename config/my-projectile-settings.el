;;; package -- Summary
;;;
;;; Commentary:
;;;
;;; Provides settings for projectile
;;;
;;; Code:

(require 'projectile)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)

;;; my-projectile-settings ends here
