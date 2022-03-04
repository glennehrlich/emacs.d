;;;; my-ggtags.el - Customizations for ggtags mode.

(require 'ggtags)

;; Don't override magit-file-dispatch on C-C M-g. Thanks, ggtags.
(define-key ggtags-mode-prefix-map (kbd "M-g") nil)

(add-hook 'c-mode-common-hook
          (lambda ()
            (ggtags-mode 1)
            (local-unset-key (kbd "C-c M-g"))
            ))

(customize-set-variable 'ggtags-global-abbreviate-filename nil)

(provide 'my-ggtags)

