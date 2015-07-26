;;;; my-cc.el - Customizations for cc mode.

(require 'cc-mode)
(require 'elec-pair nil t) ;; need to do this until I have emacs 24.4 everywhere
(require 'wrap-region)

;; Not yet ready for boeing
;; (require 'auto-complete-clang)

;; Not yet ready for boeing
;; (defvar ac-sources)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; (define-key c-mode-base-map (kbd "DEL") 'electric-pair-backward-delete-char-untabify)
(define-key c-mode-base-map (kbd "RET") 'align-newline-and-indent)
(define-key c-mode-base-map (kbd "C-<return>") 'align-current)
(define-key c-mode-base-map (kbd "M-<return>") 'c-indent-defun)

(define-key c-mode-base-map (kbd "TAB") 'c-indent-line-or-region) ;; until auto complete figured out
(define-key c-mode-base-map (kbd "S-<tab>") 'c-indent-line-or-region)
(define-key c-mode-base-map (kbd "<backtab>") 'c-indent-line-or-region)

;; Not yet ready for boeing
;; Overriden from auto-complete-config.el
;; (defun ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-gtags) ac-sources))
;;   (define-key c-mode-base-map (kbd "TAB") 'ac-complete-clang))

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-hungry-state 1)
            (when (locate-library "elec-pair")
              (electric-pair-mode 1)) ;; need to do this until I have emacs 24.4 everywhere
            (wrap-region-mode 1)

            ;; Not yet ready for boeing
            ;; (auto-complete-mode 1)

            ))

(provide 'my-cc)

