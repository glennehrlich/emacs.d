;; -*- lexical-binding: t -*-
;;;; my-shell-pop.el - Customizations for shell-pop.

(require 'shell-pop)

;; Recent emacs have changed how shell works, this fixes old code that
;; expects shell to switch to the buffer. See src/my-local.el
;; shell-with-name that has a similar fix.
;; (customize-set-variable 'shell-pop-shell-type '("shell" "*shell*" (lambda () (switch-to-buffer (shell)))))
;; (customize-set-variable 'shell-pop-shell-type '("eshell" "*eshell*" (lambda () (switch-to-buffer (eshell)))))
;; (customize-set-variable 'shell-pop-shell-type '("vterm" "*vterm*" (lambda () (vterm))))

(cond ((member 'vterm features)
       (customize-set-variable 'shell-pop-shell-type '("vterm" "*vterm*" (lambda () (vterm)))))
      (t
       (customize-set-variable 'shell-pop-shell-type '("shell" "*shell*" (lambda () (switch-to-buffer (shell)))))))

(provide 'my-shell-pop)

