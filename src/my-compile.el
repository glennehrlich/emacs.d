;;;; my-compile.el - Customizations for compilation commands.

(require 'compile)
(require 'xterm-color)

(customize-set-variable 'compilation-scroll-output t)
(customize-set-variable 'compilation-window-height 6)
; (customize-set-variable 'compile-command "make -k -j `nproc` ")
(customize-set-variable 'compile-command "make -k ")

(setq compilation-environment '("TERM=xterm-256color"))
(defun my/advice-compilation-filter (f proc string)
  (funcall f proc (xterm-color-filter string)))
(advice-add 'compilation-filter :around #'my/advice-compilation-filter)

;; Add compilation error regexp support for plantuml mode.
(add-to-list
 'compilation-error-regexp-alist-alist
 '(plantuml "^Error line \\([0-9]+\\) in file: \\(.*?\\)$" 2 1))
(add-to-list 'compilation-error-regexp-alist 'plantuml)

(provide 'my-compile)

