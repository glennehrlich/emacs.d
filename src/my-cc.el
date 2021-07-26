;;;; my-cc.el - Customizations for cc mode.

(require 'cc-mode)
(require 'ggtags) ;; further customization of ggtags is in my-ggtags
(require 'wrap-region)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(customize-set-variable 'c-offsets-alist '((arglist-intro . +)))

;; https://confluence-sdteob.web.boeing.com/pages/viewpage.action?pageId=95208047
(setq c-default-style "bsd" ; allman style
      c-basic-offset 3)     ; indent by 3 spaces

;; This seems to really mess up in c based modes like java. Alginment
;; of assignment statements and portions extend too far back, messing
;; up the aesthetics of lines. Additionally, spacing in lines in
;; mulit-line comments gets messed up as well.
;;(define-key c-mode-base-map (kbd "RET") 'align-newline-and-indent)

(define-key c-mode-base-map (kbd "C-<return>") 'align-current)
(define-key c-mode-base-map (kbd "M-<return>") 'c-indent-defun)

(define-key c-mode-base-map (kbd "TAB") 'c-indent-line-or-region) ;; until auto complete figured out
(define-key c-mode-base-map (kbd "S-<tab>") 'c-indent-line-or-region)
(define-key c-mode-base-map (kbd "<backtab>") 'c-indent-line-or-region)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-hungry-state 1)
            (wrap-region-mode 1)
            ))

(provide 'my-cc)

