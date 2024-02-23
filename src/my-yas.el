;; -*- lexical-binding: t -*-
;;;; my-yas.el - Customizations for yasnippet mode.

(require 'yasnippet)

(yas-global-mode 1)

(diminish 'yas-minor-mode)

;; ;; Turn these off so they don't conflict with auto-complete.
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap (kbd "TAB")   'yas-next-field-or-maybe-expand)
(define-key yas-keymap [(shift tab)] 'yas-prev-field)
(define-key yas-keymap [backtab]     'yas-prev-field)

(defalias 'yas 'yas-expand)

(provide 'my-yas)

