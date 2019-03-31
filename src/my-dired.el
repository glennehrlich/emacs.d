;;;; my-dired.el - Customizations for dired mode.

(require 'dired)

(customize-set-variable 'dired-dwim-target t)
(customize-set-variable 'wdired-allow-to-change-permissions t)

;; Unset dired thumbnail key-bindings.
(define-key dired-mode-map "\C-td" nil)
(define-key dired-mode-map "\C-tt" nil)
(define-key dired-mode-map "\C-tr" nil)
(define-key dired-mode-map "\C-tj" nil)
(define-key dired-mode-map "\C-ti" nil)
(define-key dired-mode-map "\C-tx" nil)
(define-key dired-mode-map "\C-ta" nil)
(define-key dired-mode-map "\C-t." nil)
(define-key dired-mode-map "\C-tc" nil)
(define-key dired-mode-map "\C-tf" nil)
(define-key dired-mode-map "\C-t\C-t" nil)
(define-key dired-mode-map "\C-te" nil)
(define-key dired-mode-map "\C-t" nil)

(provide 'my-dired)

