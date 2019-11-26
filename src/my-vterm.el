;;;; my-vterm.el - Customizations for vterm.

(require 'vterm)

(add-to-list 'vterm-keymap-exceptions "C-t")

(define-key vterm-mode-map (kbd "C-t") 'shell-pop)

(customize-set-variable 'shell-pop-shell-type '("vterm" "*vterm*" (lambda () (vterm))))

(provide 'my-vterm)

