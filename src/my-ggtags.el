;;;; my-gtags.el - Customizations for ggtags mode.

(require 'ggtags)

(dolist (hook '(c-mode-common-hook
                org-mode-hook))
  (add-hook hook (lambda () (ggtags-mode 1))))

(global-set-key (kbd "M-.")   'ggtags-find-tag)
(global-set-key (kbd "C-.")   'ggtags-find-reference)
(global-set-key (kbd "C-s-.") 'ggtags-find-other-symbol) ;; C-M-. (parallels)
(global-set-key (kbd "M-,")   'pop-tag-mark)

(define-key ggtags-mode-map (kbd "M-<f2>") 'ggtags-navigation-previous-file)
(define-key ggtags-mode-map (kbd "M-<f3>") 'ggtags-navigation-next-file)

(define-key ggtags-navigation-map (kbd "RET") 'compile-goto-error)

(provide 'my-ggtags)

