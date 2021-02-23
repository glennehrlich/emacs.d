;;;; my-java.el - Customizations for java mode.

(require 'cc-mode)
(require 'maven-test-mode)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-hungry-state 1)
            (wrap-region-mode 1)
            ))

(provide 'my-java)

