
(defun rmctrlm ()
  (mark-whole-buffer)
  (replace-string "" "")
  (goto-char (point-min)))

(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region
     (if mark-active mark (point-min))
     (if mark-active (point) (point-max))
     "python -m json.tool" (buffer-name) t)))

(defun insert-aw-copyright ()
  (interactive)
  (call-process
   "python" nil t nil
   (concat
    (getenv "HOME") "/bin/copyright.py") "-o" buffer-file-name))

(defun insert-copyright ()
  (interactive)
  (insert-aw-copyright))

;;
; myz-filename-chars specifies the characters that are allowed
; to appear in filenames. this is used for next-error type
; look-ups
;
(setq myz-filename-chars "\\-\\:\\.,/A-Za-z0-9_~!@$%&+=\\\\")
(setq myz-symbol-chars "\\->A-Za-z0-9_\\.")

;;
; Get the word at the current cursor that matches the given patter
;
(defun look-up-at-cursor (pattern-chars)
  (save-excursion
    (buffer-substring-no-properties
     (progn
       (if (not (looking-at pattern-chars))
           (re-search-backward "\\w" nil t))
       (skip-chars-backward pattern-chars)
       (point))
     (progn
       (skip-chars-forward pattern-chars)
       (point)
       ))))

;;
; lookup a filename:lineno at the current cursor. attempt to
; open the file and goto the lineno specified.
;
(defun line-file-lookup-at-cursor (line-jump)
  (interactive)
  (let* ((symbol-char-regexp (concat "[" myz-filename-chars "]"))
         (the-filename (look-up-at-cursor symbol-char-regexp))
         (file-line (split-string the-filename "\\:"))
         (c-buf (current-buffer)))
    (let ()
      (find-file-other-window (car file-line))
      (goto-line (string-to-int (car (cdr file-line))))
      (pop-to-buffer c-buf)
      (next-line line-jump))))

(defun symbol-lookup-at-cursor ()
  (interactive)
  (look-up-at-cursor (concat "[" myz-symbol-chars "]")))

(defun line-file-lookup-at-cursor-forward ()
  (interactive)
  (line-file-lookup-at-cursor 1))

(defun line-file-lookup-at-cursor-bkward ()
  (interactive)
  (line-file-lookup-at-cursor -1))

(defun print-var-at-cursor ()
 (interactive)
  (let ((the-var (look-up-at-cursor (concat "[" myz-symbol-chars "]")))
        (cur-loc (point)))
    (next-line 1)
    (beginning-of-line)
    (indent-relative)
    (printVar the-var)
    (insert "\n")
    (goto-char (cur-loc))
    (next-line 1)))

(defun api-wrap-at-cursor ()
  (interactive)
  (let ((the-var (look-up-at-cursor (concat "[" myz-symbol-chars "]"))))
    (next-line 1)
    (beginning-of-line)
    (insert (concat "static const MFn::Type "
                    (concat the-var "FuncSets[] = {\n")))
    (insert "\tMFn::kKeyframeDelta,\n")
    (insert "};\n")
    (insert (concat (concat "MimplementAPI(" the-var)
                    ", kKeyframeDeltaXXX, " (concat the-var "FuncSets);")))
    (insert "\n")
    (next-line 1)))


(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message 
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window 
                                 (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))


(defun insert-random-uuid ()
  "Insert a UUID. This uses a simple hashing of variable data.
Example of a UUID: 1df63142-a513-c850-31a3-535fc3520c3d

Note: this code uses https://en.wikipedia.org/wiki/Md5 , which is not cryptographically safe. I'm not sure what's the implication of its use here.

Version 2015-01-30
URL `http://ergoemacs.org/emacs/elisp_generate_uuid.html'
"
;; by Christopher Wellons, 2011-11-18. Editted by Xah Lee.
;; Edited by Hideki Saito further to generate all valid variants for "N" in xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx format.
  (interactive)
  (let ((myStr (md5 (format "%s%s%s%s%s%s%s%s%s%s"
                            (user-uid)
                            (emacs-pid)
                            (system-name)
                            (user-full-name)
                            (current-time)
                            (emacs-uptime)
                            (garbage-collect)
                            (buffer-string)
                            (random)
                            (recent-keys)))))

    (insert (format "%s-%s-4%s-%s%s-%s"
                    (substring myStr 0 8)
                    (substring myStr 8 12)
                    (substring myStr 13 16)
                    (format "%x" (+ 8 (random 4)))
                    (substring myStr 17 20)
                    (substring myStr 20 32)))))
