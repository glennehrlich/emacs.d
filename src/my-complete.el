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

(setq ac-comphist-file "~/.emacs.d.persistent/auto-complete/ac-comphist.dat")

(ac-config-default)

(setq ac-use-menu-map t)

(diminish 'auto-complete-mode)

(setq ac-modes '(
                 ;; ada-mode
                 ;; agda-mode
                 ;; agda2-mode
                 ;; c++-mode
                 ;; c-mode
                 ;; cc-mode
                 ;; clojure-mode
                 ;; clojurescript-mode
                 ;; coq-mode
                 ;; cperl-mode
                 ;; css-mode
                 ;; ecmascript-mode
                 emacs-lisp-mode
                 ;; f90-mode
                 ;; fortran-mode
                 ;; go-mode
                 ;; haskell-mode
                 ;; java-mode
                 ;; javascript-mode
                 ;; js-mode
                 ;; js2-mode
                 lisp-interaction-mode
                 lisp-mode
                 ;; lua-mode
                 makefile-mode
                 ;; malabar-mode
                 ;; ocaml-mode
                 ;; perl-mode
                 ;; php-mode
                 ;; python-mode
                 ;; ruby-mode
                 ;; scala-mode
                 ;; scheme-mode
                 ;; sclang-mode
                 ;; sgml-mode
                 sh-mode
                 slime-repl-mode
                 ;; ts-mode
                 ;; tuareg-mode
                 ;; verilog-mode
                 xml-mode
                 ))

(provide 'my-complete)

