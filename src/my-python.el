;;;; my-python.el - Customizations for python mode.

(require 'python)
(require 'elpy)

;; Turn off some of the elpy modules.
(setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
(setq elpy-modules (delq 'elpy-module-yasnippet             elpy-modules))

;; Have elpy use flycheck instead of flymake.
(remove-hook 'elpy-modules 'elpy-module-flymake)
(add-hook 'elpy-mode-hook 'flycheck-mode)

;; Add some key bindings when elpy-mode is in effect. These could be
;; done in python-mode-hook, but adding them to elpy-mode-hook means I
;; don't have to determine if elpy-mode-hook overrides anything in
;; python-mode.
(add-hook 'elpy-mode-hook
          (lambda ()
            (local-set-key (kbd "M-q") 'python-fill-paragraph)
            (local-set-key (kbd "C-M-\\") (lambda () (interactive) (message "Warning: do not use indent-region in python code; use python-indent-shift-left (C-c <) or python-indent-shift-right (C-c >).")))
            ))

;; Turn on elpy.
(elpy-enable)

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

;; (require 'python)
;; (require 'elpy)
;; (require 'jedi)

;; (customize-set-variable 'python-environment-directory "~/.emacs.d.persistent/python-environments")
;; (customize-set-variable 'python-shell-interpreter "ipython")
;; (customize-set-variable 'python-shell-interpreter-args "-i --simple-prompt --pprint")

;; ;; For some reason, emacs 25 messes up python mode's testing for
;; ;; whether readline support is enabled in the python interpreter.
;; ;; This brute forces turns off readline support so we don't get
;; ;; spurious warnings in the *Warnings* buffer.
;; (customize-set-variable 'python-shell-completion-native-enable nil)

;; ;; Add some key bindings when elpy-mode is in effect. These could be
;; ;; done in python-mode-hook, but adding them to elpy-mode-hook means I
;; ;; don't have to determine if elpy-mode-hook overrides anything in
;; ;; python-mode.
;; (add-hook 'elpy-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "M-q") 'python-fill-paragraph)
;;             (local-set-key (kbd "C-M-\\") (lambda () (interactive) (message "Warning: do not use indent-region in python code; use python-indent-shift-left (C-c <) or python-indent-shift-right (C-c >).")))
;;             (local-set-key (kbd "M-.") 'elpy-goto-definition)
;;             ))

;; ;; Have elpy use flycheck instead of flymake.
;; (remove-hook 'elpy-modules 'elpy-module-flymake)
;; (add-hook 'elpy-mode-hook 'flycheck-mode)

;; ;; Setup jedi
;; ; (setq elpy-rpc-backend "jedi") ; glenn 2018-01-29; this variable no longer available; remove if this never comes back
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:complete-on-dot t)
;; (jedi:install-server)

;; ;; Turn off some of the elpy modules.
;; (setq elpy-modules (delq 'elpy-module-company               elpy-modules))
;; (setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
;; (setq elpy-modules (delq 'elpy-module-yasnippet             elpy-modules))

;; ; (customize-set-variable 'jedi:get-in-function-call-delay 10000000) ; prevent annoying jedi in function display

;; ;; Turn on elpy.
;; (elpy-enable)

;; ;; Insert an empty __init__.py into the current directory.
;; (defun init-py ()
;;   "Create an empty __init__.py in the current directory if it
;; does not already exist.  If executed in a Dired buffer, refresh
;; the Dired buffer."
;;   (interactive)
;;   (let ((init "__init__.py"))
;;     (if (file-exists-p init)
;;         (error "__init__.py already exists")
;;       (progn
;;         (write-region "" nil init)
;;         (when (eq major-mode 'dired-mode)
;;           (revert-buffer))))))

(provide 'my-python)
