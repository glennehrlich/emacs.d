;;;; my-paredit.el - Customizations for paredit mode.

(require 'diminish)
(require 'lisp-mode)
(require 'ielm)
(require 'paredit)
(require 'paredit-menu)

(diminish 'paredit-mode)

(define-key paredit-mode-map (kbd "M-?") 'query-replace-regexp)

(dolist (hook '(emacs-lisp-mode-hook
                ;; ielm-mode-hook ;; I don't like this in ielm
                lisp-mode-hook
                lisp-interaction-mode-hook
                scheme-mode-hook))
  (add-hook hook 'paredit-mode))

(provide 'my-paredit)

