;;;; my-haskell.el - Customizations for hasekll mode.

(require 'haskell-mode)
(require 'hi2)

(define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
(define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
(define-key haskell-mode-map (kbd "C-c h") 'haskell-hoogle)

(add-hook 'haskell-mode-hook 'turn-on-hi2)

(provide 'my-haskell)

