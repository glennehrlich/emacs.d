;; -*- lexical-binding: t -*-
;;;; my-paredit.el - Customizations for paredit mode.

(require 'diminish)
(require 'lisp-mode)
(require 'ielm)
(require 'paredit)
(require 'paredit-menu)

(diminish 'paredit-mode)

(define-key paredit-mode-map (kbd "M-?") 'query-replace-regexp)

(defun disable-smartparens ()
  (smartparens-mode 0))

(add-hook 'c-mode-common-hook 'disable-smartparens)

(dolist (hook '(emacs-lisp-mode-hook
                ;; ielm-mode-hook ;; I don't like this in ielm
                lisp-mode-hook
                lisp-interaction-mode-hook
                scheme-mode-hook))
  (add-hook hook 'paredit-mode)
  (add-hook hook 'disable-smartparens))

(provide 'my-paredit)

