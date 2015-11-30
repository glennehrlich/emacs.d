;;;; my-elisp.el - Customizations for emacs-lisp mode.

(require 'diminish)
(require 'eldoc)
(require 'elisp-slime-nav)
;; (require 'flycheck)
(require 'lisp-mode)
(require 'ielm)
(require 'morlock)

;; (defvar flycheck-emacs-lisp-load-path)
;; (defvar flycheck-disabled-checkers)

(diminish 'eldoc-mode)
(diminish 'elisp-slime-nav-mode)
;; (diminish 'flycheck-mode)

(dolist (hook '(emacs-lisp-mode-hook
                ielm-mode-hook
                lisp-interaction-mode-hook))
  (dolist (mode '(turn-on-eldoc-mode
                  turn-on-elisp-slime-nav-mode))
    (add-hook hook mode)))

(dolist (mode '(emacs-lisp-mode
                ;; inferior-emacs-lisp-mode ;; doesn't work
                lisp-interaction-mode))
  (font-lock-add-keywords mode morlock-font-lock-keywords))

;; 2015/01/06: flycheck generates an error on loading, so disabling this.
;; (add-hook 'emacs-lisp-mode-hook
;;           (lambda ()
;;             (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc))
;;             (setq flycheck-emacs-lisp-load-path load-path)
;;             (flycheck-mode 1)
;;             ))

(provide 'my-elisp)

