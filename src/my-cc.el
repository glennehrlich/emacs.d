;;;; my-cc.el - Customizations for cc mode.

(require 'cc-mode)
(require 'ggtags) ;; further customization of ggtags is in my-ggtags
(require 'wrap-region)
(require 'magit-git)

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
(define-key c-mode-base-map (kbd "C-x m") 'compile-cmake)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-hungry-state 1)
            (wrap-region-mode 1)
            ))

(defun compile-cmake (test-name)
  "Make all and run all tests in the current git repo's build directory. If TEST-NAME is provide, make TEST-NAME and run it."
  (interactive "sTest name: ")
  (let ((build-dir (concat (magit-toplevel) "build"))
        (command))
    (unless (file-directory-p build-dir)
      (error "No such directory: %s" build-dir))
    (if (string-empty-p test-name)
        (setq command (format "cd %s/ ; make && ctest --verbose" build-dir))
      (setq command (format "cd %s/ ; make %s && ctest --verbose -R %s" build-dir test-name test-name)))
    (compile command)))
  
(provide 'my-cc)

