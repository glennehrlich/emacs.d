;;;; custom.el - Custumization settings.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-list-file-prefix "~/.emacs.d.persistent/auto-save-list/saves-")
 '(blink-cursor-blinks 0)
 '(column-number-mode t)
 '(comint-input-ignoredups t)
 '(compilation-scroll-output t)
 '(compilation-window-height 6)
 '(custom-enabled-themes (quote (base16-chalk)))
 '(custom-safe-themes t)
 '(delete-selection-mode t)
 '(enable-local-variables :all)
 '(font-lock-verbose nil)
 '(gdb-many-windows t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(package-selected-packages
   (quote
    (zerodark-theme wrap-region wgrep-ag wgrep web-mode visual-regexp use-package undo-tree try theme-looper swiper smex smartparens skewer-reload-stylesheets puml-mode paredit-menu paradox org-plus-contrib noctilux-theme niflheim-theme morlock markdown-mode magit julia-shell json-mode jedi ivy-hydra ivy impatient-mode idea-darkula-theme hydra hungry-delete hi2 haskell-mode git-timemachine ggtags fuzzy flx flycheck expand-region exec-path-from-shell elpy elisp-slime-nav eldoc-extension dropdown-list counsel cmake-mode cmake-font-lock bash-completion base16-theme avy ag ace-window)))
 '(paradox-github-token t)
 '(recentf-save-file "~/.emacs.d.persistent/recentf/recentf")
 '(save-place-mode nil)
 '(sp-show-pair-from-inside t)
 '(split-height-threshold nil)
 '(split-width-threshold 160)
 '(tool-bar-mode nil)
 '(url-configuration-directory "~/.emacs.d.persistent/url/")
 '(use-package-verbose t)
 '(vc-annotate-background nil)
 '(vc-make-backup-files t)
 '(visual-line-mode nil t)
 '(woman-use-own-frame nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-fine-diff-B ((t (:background "dark olive green"))))
 '(popup-isearch-match ((t (:background "sky blue" :foreground "black"))))
 '(sp-show-pair-match-face ((t (:background "gray50")))))

