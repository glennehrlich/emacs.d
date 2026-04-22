;; -*- lexical-binding: t -*-
;;;; my-python.el - Customizations for python mode.

(require 'corfu)
(require 'eglot)
(require 'flymake)
(require 'jupyter-repl)
(require 'python)

;; Python modes hook.
(defun my-python-hook ()
  (eglot-ensure)
  (setq corfu-auto t)                 ; turn on corfu for auto completion
  (setq corfu-cycle t)                ; cycle through completion candidates with tab
  (setq tab-always-indent 'complete)) ; tab key attempts smart completion or indentation
(add-hook 'python-mode-hook 'my-python-hook)
(add-hook 'python-ts-mode-hook 'my-python-hook)

(customize-set-variable 'python-indent-guess-indent-offset-verbose nil)

(define-key python-ts-mode-map (kbd "<f2>") 'flymake-goto-prev-error)
(define-key python-ts-mode-map (kbd "<f3>") 'flymake-goto-next-error)

;; Make the jupyter repl fonts more readable when using dark
;; background.
(custom-set-faces
 '(jupyter-repl-input-prompt ((t (:foreground "cyan"))))
 '(jupyter-repl-output-prompt ((t (:foreground "yellow")))))

;; Insert an empty __init__.py into the current directory.
(defun init-py ()
  "Create an empty __init__.py in the current directory if it
does not already exist.  If executed in a Dired buffer, refresh
the Dired buffer."
  (interactive)
  (let ((init "__init__.py"))
    (if (file-exists-p init)
        (error "__init__.py already exists")
      (progn
        (write-region "" nil init)
        (when (eq major-mode 'dired-mode)
          (revert-buffer))))))

(defun f-string ()
  "Create an empty f-string."
  (interactive)
  (insert "f''''''")
  (backward-char 3))

(provide 'my-python)
