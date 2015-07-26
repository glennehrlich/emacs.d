;;;; my-geiser.el - Customizations for geiser mode.

(require 'geiser-mode)

(defun geiser-restart-repl-and-reload-module ()
  "Restart the repl and then reload the module.  Similar to the Racket Run command."
  (interactive)
  (geiser-restart-repl)
  (geiser-mode-switch-to-repl-and-enter))

(define-key geiser-mode-map (kbd "<f5>") 'geiser-mode-switch-to-repl-and-enter)
(define-key geiser-mode-map (kbd "C-<f5>") 'geiser-restart-repl-and-reload-module)
(define-key geiser-mode-map (kbd "RET") 'newline-and-indent)

(provide 'my-geiser)

