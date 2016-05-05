;;;; my-python.el - Customizations for python mode.

(require 'python)
(require 'elpy)
(require 'py-autopep8)

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

;; Turn on elpy.
(elpy-enable)

(provide 'my-python)
