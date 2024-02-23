;; -*- lexical-binding: t -*-
;;;; my-complete.el - Customizations for auto-complete and yasnippet.

;;; ==============================================================
;;; These are in the same file so I can control their interactions
;;; better.
;;; ==============================================================

;; ;;; =========
;; ;;; yasnippet
;; ;;; =========

;; (require 'yasnippet)
;; (require 'auto-yasnippet)

;; (yas-global-mode 1)

;; (diminish 'yas-minor-mode)

;; ;; ;; Turn these off so they don't conflict with auto-complete.
;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)

;; (define-key yas-keymap (kbd "TAB")   'yas-next-field-or-maybe-expand)
;; (define-key yas-keymap [(shift tab)] 'yas-prev-field)
;; (define-key yas-keymap [backtab]     'yas-prev-field)

;; (global-set-key (kbd "s-w") 'aya-create)
;; (global-set-key (kbd "s-y") 'aya-expand)

;; (defalias 'yas 'yas-expand)

;;; =============
;;; auto-complete
;;; =============

(require 'auto-complete-config)

(customize-set-variable 'ac-comphist-file "~/.emacs.d.persistent/auto-complete/ac-comphist.dat")

(ac-config-default)

(setq ac-use-menu-map t)

(diminish 'auto-complete-mode)

(setq ac-modes '(
                 emacs-lisp-mode
                 lisp-interaction-mode
                 lisp-mode
                 makefile-mode
                 sh-mode
                 slime-repl-mode
                 xml-mode
                 ))

(provide 'my-complete)

