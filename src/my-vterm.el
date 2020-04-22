;;;; my-vterm.el - Customizations for vterm.

(require 'vterm)

(add-to-list 'vterm-keymap-exceptions "C-t")

(define-key vterm-mode-map (kbd "C-t") 'shell-pop)

;; C-l clears both visible screen and previous output (the "scrollback")
(customize-set-variable 'vterm-clear-scrollback-when-clearing t)

(provide 'my-vterm)

