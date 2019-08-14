;;;; my-haskell.el - Customizations for hasekll mode.

(require 'haskell-mode)
(require 'hi2)
(require 'haskell-interactive-mode)

(setq haskell-process-path-ghci "ghci-ng")

(define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
(define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)
(define-key haskell-mode-map (kbd "C-c h") 'haskell-hoogle)

(add-hook 'haskell-mode-hook 'turn-on-hi2)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(provide 'my-haskell)

