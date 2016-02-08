;;;; my-local.el - Stuff I write.

(require 'recentf)

(defun any-mode-untabify ()
  "Untabify automatically on file write.  Add this to a mode hook:

\(add-hook 'some-mode-hook  
           '(lambda () 
               (make-local-hook 'write-contents-hooks) 
                (add-hook 'write-contents-hooks 'any-mode-untabify nil t)))"
  (save-excursion
    (goto-char (point-min))
    (when (search-forward "\t" nil t)
      (untabify (1- (point)) (point-max)))
    nil))

(defun branches ()
  "\"Edit\" directory ~/r/branhces using `dired'."
  (interactive)
  (dired "~/r/branches"))

(defun my-apply-keyboard-macro-to-region-lines-query-for-macro (top bottom macro)
  "Apply keyboard macro to all lines in the region.  Query for the macro name."
  (interactive "r\nafunction: ")
  (or macro
      (progn
	(if (null last-kbd-macro)
	    (error "No keyboard macro has been defined"))
	(setq macro last-kbd-macro)))
  (save-excursion
    (let ((end-marker (copy-marker bottom))
	  next-line-marker)
      (goto-char top)
      (if (not (bolp))
	  (forward-line 1))
      (setq next-line-marker (point-marker))
      (while (< next-line-marker end-marker)
	(goto-char next-line-marker)
	(save-excursion
	  (forward-line 1)
	  (set-marker next-line-marker (point)))
	(save-excursion
	  (let ((mark-active nil))
	    (execute-kbd-macro macro))))
      (set-marker end-marker nil)
      (set-marker next-line-marker nil))))

(defalias 'rb 'rename-buffer)

(defalias 'ar 'align-regexp)

(defun align-c-function-parameters ()
  "Align function call parameters in region."
  (interactive)
  (unless (region-active-p) (error "No region selected"))
  (align-regexp (region-beginning) (region-end) "[,(]\\(\\s-*\\)" 1 1 t)
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)\\()[ \t]*;\\)" 1 1 t))
(defalias 'ac 'align-c-function-parameters)

(defun shells ()
  "Create shells s0, s1, and s2."
  (interactive)
  (shell) (rename-buffer "s2")
  (shell) (rename-buffer "s1")
  (shell) (rename-buffer "s0"))

(defun eshells ()
  "Create eshells e0, e1, and e2."
  (interactive)
  (eshell) (rename-buffer "e2")
  (eshell) (rename-buffer "e1")
  (eshell) (rename-buffer "e0"))

(defun todo ()
  "Visit ~/r/kinetx/todo.org."
  (interactive)
  (find-file "~/r/kinetx/todo.org"))

(defun passwords ()
  "Visit ~/r/notes/passwords.org."
  (interactive)
  (find-file "~/r/notes/passwords.org"))

(defun start ()
  "Create the shells and visit ~/r/kinetx/todo.org."
  (interactive)
  (shells)
  (todo)
  (delete-other-windows))

(defun elpa ()
  "\"Edit\" directory ~/.emacs.d.elpa using `dired'."
  (interactive)
  (dired "~/.emacs.d.elpa"))

(defun emacs.d ()
  "\"Edit\" directory ~/.emacs.d using `dired'."
  (interactive)
  (dired "~/.emacs.d"))

(defun home ()
  "\"Edit\" directory ~ using `dired'."
  (interactive)
  (dired "~"))

(defun notes ()
  "\"Edit\" directory ~/r/notes using `dired'."
  (interactive)
  (dired "~/r/notes"))

(defun my-current-line ()
  "Return the current line."
  (interactive)
  (buffer-substring (line-beginning-position) (line-end-position)))

(defun my-apply-function-to-region-lines (fn)
  "Apply function to all lines in the region.
For each line that begins in the region, move to the beginning of
the line, and run the function.

When called from lisp, this function takes two arguments TOP and
BOTTOM, describing the current region.  TOP must be before BOTTOM."
  (interactive "aFunction to apply to lines in region: ")
  (save-excursion
    (goto-char (region-end))
    (let ((end-marker (copy-marker (point-marker)))
          next-line-marker)
      (goto-char (region-beginning))
      (if (not (bolp))
          (forward-line 1))
      (setq next-line-marker (point-marker))
      (while (< next-line-marker end-marker)
        (let ((start nil)
              (end nil))
          (goto-char next-line-marker)
          (save-excursion
            (setq start (point))
            (forward-line 1)
            (set-marker next-line-marker (point))
            (setq end (point)))
          (save-excursion
            (let ((mark-active nil))
              (narrow-to-region start end)
              (funcall fn)
              (widen)))))
      (set-marker end-marker nil)
      (set-marker next-line-marker nil))))

(defun sort-and-delete-duplicate-lines ()
  "Sort and uniquify the lines in region."
  (interactive)
  (sort-lines nil
              (region-beginning)
              (region-end))
  (delete-duplicate-lines (region-beginning)
                          (region-end)))

(defun phone-numbers ()
  "Visit ~/r/notes/phone_numbers.org."
  (interactive)
  (find-file "~/r/notes/phone_numbers.org"))

(defun my-narrow-to-region ()
  "Like `narrow-to-region', except that it deactivates the mark."
  (interactive)
  (narrow-to-region (region-beginning) (region-end))
  (deactivate-mark)
  (goto-char (point-min)))

(defun my-recentf-delete ()
  "Delete the recent list."
  (interactive)
  (setq recentf-list nil))

(provide 'my-local)

