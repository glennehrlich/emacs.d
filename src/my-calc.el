;;;; my-calc.el - Customizations for calc mode.

(require 'calc)

(customize-set-variable 'calc-settings-file "~/.emacs.d/calc-settings.el")

(defun calc-eval-region (beg end)
  "Evaluate the algebraic calc expression in the region and replace
it with the result."
  (interactive "r")
  (let ((result (calc-eval (buffer-substring-no-properties beg end))))
    (delete-region beg end)
    (insert result)))

(defun calc-pop-all ()
  "Pop (delete) all the items on the stack."
  (interactive)
  (calc-pop 0))

(define-key calc-mode-map (kbd "C-c C-t") 'calc-pop-all)

(provide 'my-calc)

