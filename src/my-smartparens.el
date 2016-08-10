;;;; my-smartparens.el - Customizatoins for smartparens mode.

(require 'diminish)
(require 'smartparens-config)

(diminish 'smartparens-mode)

(smartparens-global-mode t)

(customize-set-variable 'sp-show-pair-from-inside t)
(custom-set-faces '(sp-show-pair-match-face ((t (:background "gray50")))))
(show-smartparens-global-mode t)

(provide 'my-smartparens)
