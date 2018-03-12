;;;; my-ivy.el - Customizations for ivy mode.

(require 'counsel)
(require 'diminish)
(require 'ivy)

(ivy-mode 1)
(diminish 'ivy-mode)

;; Set this here, as we are no longer directly loading smex, but
;; counsel-M-x will load it.
(customize-set-variable 'smex-save-file "~/.emacs.d.persistent/smex/smex-items")

(customize-set-variable 'counsel-ag-base-command "ag --hidden --ignore .git --nocolor --nogroup %s")
(customize-set-variable 'counsel-find-file-at-point t)
(customize-set-variable 'counsel-rg-base-command "rg --hidden --glob !.git -S --no-heading --line-number --color never %s .")
(customize-set-variable 'ivy-count-format "%d/%d ")
(customize-set-variable 'ivy-use-selectable-prompt t)

(global-set-key (kbd "C-h a")   'counsel-apropos)
(global-set-key (kbd "C-h f")   'counsel-describe-function)
(global-set-key (kbd "C-h v")   'counsel-describe-variable)
(global-set-key (kbd "C-s")     'counsel-grep-or-swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x")     'counsel-M-x)
(global-set-key (kbd "<f8>")    'counsel-ag)
(global-set-key (kbd "<C-f8>")  'counsel-rg)

(setq ivy-re-builders-alist
      '((counsel-M-x . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))

(provide 'my-ivy)

