;;;; my-ivy.el - Customizations for ivy mode.

(require 'diminish)
(require 'ivy)

(ivy-mode 1)
(diminish 'ivy-mode)

(global-set-key (kbd "C-h f")   'counsel-describe-function)
(global-set-key (kbd "C-h v")   'counsel-describe-variable)
(global-set-key (kbd "C-s")     'counsel-grep-or-swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x")     'counsel-M-x)
(global-set-key (kbd "<f8>")    'counsel-ag)

(setq ivy-re-builders-alist
      '((counsel-M-x . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))

(provide 'my-ivy)

