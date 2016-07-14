;;;; my-ggtags.el - Customizations for ggtags mode.

(require 'ggtags)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'java-mode)
              (ggtags-mode 1))))

(customize-set-variable 'ggtags-global-abbreviate-filename nil)

(provide 'my-ggtags)

