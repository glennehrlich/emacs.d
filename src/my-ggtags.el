;; -*- lexical-binding: t -*-
;;;; my-ggtags.el - Customizations for ggtags mode.

(require 'ggtags)

;; Don't override these common key bindings. Thanks, ggtags.
(define-key ggtags-mode-prefix-map (kbd "M-o") nil)
(define-key ggtags-mode-prefix-map (kbd "M-g") nil)
(define-key ggtags-navigation-map (kbd "M-o") nil)

(defun ggtags-mode-setup ()
  (ggtags-mode 1)

  ;; Remove ggtags mode keybindings that I'd rather it
  ;; didn't override.
  (keymap-unset ggtags-navigation-map "C-c M-g" t)
  (keymap-unset ggtags-navigation-map "M-=" t))

(add-hook 'c-mode-common-hook 'ggtags-mode-setup)
(add-hook 'org-mode-hook      'ggtags-mode-setup)

(customize-set-variable 'ggtags-global-abbreviate-filename nil)

(provide 'my-ggtags)

