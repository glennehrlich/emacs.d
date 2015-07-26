;;;; my-lisp.el - Customizations for lisp mode.

(require 'lisp-mode)

(put 'with-accessors 'common-lisp-indent-function 2)
(put 'with-output-to-string 'common-lisp-indent-function 1)
(put 'with-slots 'common-lisp-indent-function 2)
(setq-default lisp-simple-loop-indentation 1)
(setq-default lisp-loop-keyword-indentation 6)
(setq-default lisp-loop-forms-indentation 6)

(define-key lisp-mode-map (kbd "RET") 'newline-and-indent)

(provide 'my-lisp)

