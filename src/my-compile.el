;;;; my-compile.el - Customizations for compilation commands.

(require 'compile)
(require 'xterm-color)

(customize-set-variable 'compilation-scroll-output t)
(customize-set-variable 'compilation-window-height 6)

(setq compilation-environment '("TERM=xterm-256color"))
(defun my/advice-compilation-filter (f proc string)
  (funcall f proc (xterm-color-filter string)))
(advice-add 'compilation-filter :around #'my/advice-compilation-filter)

(provide 'my-compile)

