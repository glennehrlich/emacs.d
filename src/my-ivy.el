;;;; my-ivy.el - Customizations for ivy mode.

(require 'counsel)
(require 'diminish)
(require 'ivy)

(ivy-mode 1)
(diminish 'ivy-mode)

(counsel-mode 1)
(diminish 'counsel-mode)

;; Set this here, as we are no longer directly loading smex, but
;; counsel-M-x will load it.
(customize-set-variable 'smex-save-file "~/.emacs.d.persistent/smex/smex-items")

(customize-set-variable 'counsel-find-file-at-point t)
(customize-set-variable 'counsel-mode-override-describe-bindings t)
(customize-set-variable 'counsel-rg-base-command "rg --hidden --glob !.git -S --no-heading --line-number --color never %s .")
(customize-set-variable 'counsel-yank-pop-separator "\n----\n")
(customize-set-variable 'ivy-count-format "%d/%d ")
(customize-set-variable 'ivy-use-selectable-prompt t)

(setq ivy-re-builders-alist
      '((counsel-M-x . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))

(global-set-key (kbd "<f8>")  'counsel-rg)
(global-set-key (kbd "C-s")   'counsel-grep-or-swiper)
(global-set-key (kbd "C-x b") 'counsel-switch-buffer)

(provide 'my-ivy)
