;; -*- lexical-binding: t -*-
;;;; my-python.el - Customizations for python mode.

(require 'eglot)
(require 'flymake)
(require 'python)


(add-hook 'python-ts-mode-hook #'eglot-ensure)

(define-key python-ts-mode-map (kbd "<f2>") 'flymake-goto-prev-error)
(define-key python-ts-mode-map (kbd "<f3>") 'flymake-goto-next-error)

;; ;; glenn: disalbing this until I figure out what to do with it
;; ;; (add-hook 'python-mode-hook 'importmagic-mode)


;; ;; Always scroll to the end of the *Python* buffer.
;; (add-hook 'inferior-python-mode-hook
;;           (lambda ()
;;             (setq comint-scroll-to-bottom-on-output t)))

;; ;; Use ipthon.
;; ;; (setq python-shell-interpreter "ipython"
;; ;;       python-shell-interpreter-args "--simple-prompt -i")

;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "--simple-prompt -c exec('__import__(\\'readline\\')') -i")

;; ;; Use jupyter console.
;; ;; (setq python-shell-interpreter "jupyter"
;; ;;       python-shell-interpreter-args "console --simple-prompt"
;; ;;       python-shell-prompt-detect-failure-warning nil)
;; ;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;; ;;              "jupyter")

;; ;; Turn on elpy.
;; ;; glenn: 2022-11-16 turning elpy off because it is annoying when looking at random python code
;; ;; (elpy-enable)

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
