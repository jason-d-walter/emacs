;; When loading a 'README' file assume it is a text-mode document.
;;
(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))

(defun part-of-paragraph ()
  "Used to determine whether the current line is part of a paragraph.
Returns nil if the line is blank or is not preceded by `fill-prefix';
returns non-nil otherwise.
  Must be used from the beginning of the line."
  (and (not (looking-at blank-line-regexp))
       (or (not fill-prefix)
    (looking-at fill-prefix))))

(defun unfill-paragraph ()
  "Do the opposite of `fill-paragraph'.
Takes the current paragraph with newline-separated lines and uses
`delete-indentation' to make one long string out of the paragraph."
  (interactive)
  (save-excursion
    (while (not (part-of-paragraph))
      (forward-line 1))
    (forward-line 1)
    (while (and (part-of-paragraph)
  (not (eq (point) (point-max))))
      (delete-indentation)
      (forward-line 1))))
