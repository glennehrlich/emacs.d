;;;; my-cc.el - Customizations for cc mode.

(require 'cc-mode)
(require 'elec-pair nil t) ;; need to do this until I have emacs 24.4 everywhere
(require 'ggtags) ;; further customization of ggtags is in my-ggtags
(require 'wrap-region)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(customize-set-variable 'c-offsets-alist '((arglist-intro . +)))


;; (define-key c-mode-base-map (kbd "DEL") 'electric-pair-backward-delete-char-untabify)
(define-key c-mode-base-map (kbd "RET") 'align-newline-and-indent)
(define-key c-mode-base-map (kbd "C-<return>") 'align-current)
(define-key c-mode-base-map (kbd "M-<return>") 'c-indent-defun)

(define-key c-mode-base-map (kbd "TAB") 'c-indent-line-or-region) ;; until auto complete figured out
(define-key c-mode-base-map (kbd "S-<tab>") 'c-indent-line-or-region)
(define-key c-mode-base-map (kbd "<backtab>") 'c-indent-line-or-region)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-hungry-state 1)
            (when (locate-library "elec-pair")
              (electric-pair-mode 1)) ;; need to do this until I have emacs 24.4 everywhere
            (wrap-region-mode 1)
            ))

(provide 'my-cc)

