;;;; my-vterm.el - Customizations for vterm.

(require 'vterm)

(add-to-list 'vterm-keymap-exceptions "C-t")

(define-key vterm-mode-map (kbd "C-t") 'shell-pop)

(provide 'my-vterm)

