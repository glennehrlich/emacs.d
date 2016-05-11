;;;; my-python.el - Customizations for python mode.

(require 'python)
(require 'elpy)
(require 'jedi)
(require 'py-autopep8)

;; Add some key bindings when elpy-mode is in effect. These could be
;; done in python-mode-hook, but adding them to elpy-mode-hook means I
;; don't have to determine if elpy-mode-hook overrides anything in
;; python-mode.
(add-hook 'elpy-mode-hook
          (lambda ()
            (local-set-key (kbd "M-q") 'python-fill-paragraph)))

;; Have elpy use flycheck instead of flymake.
(remove-hook 'elpy-modules 'elpy-module-flymake)
(add-hook 'elpy-mode-hook 'flycheck-mode)

;; Have elpy auto format when saving.
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; For some reason, emacs 25 messes up python mode's testing for
;; whether readline support is enabled in the python interpreter.
;; This brute forces turns off readline support so we don't get
;; spurious warnings in the *Warnings* buffer.
(setq python-shell-completion-native-enable nil)

;; Setup jedi
(setq elpy-rpc-backend "jedi")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(jedi:install-server)

;; Turn off some of the elpy modules.
(setq elpy-modules (delq 'elpy-module-company               elpy-modules))
(setq elpy-modules (delq 'elpy-module-highlight-indentation elpy-modules))
(setq elpy-modules (delq 'elpy-module-yasnippet             elpy-modules))

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

(provide 'my-python)
