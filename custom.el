;;;; custom.el - Custumization settings.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-clang-flags (quote ("-std=c++11")) t)
 '(ac-comphist-file "~/.emacs.d.persistent/auto-complete/ac-comphist.dat")
 '(ac-dictionary-files (quote ("~.emacs.d.persistent/auto-complete")))
 '(auto-save-list-file-prefix "~/.emacs.d.persistent/auto-save-list/saves-")
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/r/backups/emacs"))))
 '(blink-cursor-blinks 0)
 '(c-offsets-alist (quote ((arglist-intro . +))))
 '(comint-input-ignoredups t)
 '(compilation-scroll-output t)
 '(compilation-window-height 6)
 '(counsel-find-file-at-point t)
 '(custom-enabled-themes (quote (base16-chalk)))
 '(custom-safe-themes t)
 '(delete-old-versions t)
 '(dired-dwim-target t)
 '(dired-kept-versions 2)
 '(enable-local-variables :all)
 '(gdb-many-windows t)
 '(ggtags-global-abbreviate-filename nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kept-new-versions 10)
 '(kept-old-versions 10)
 '(magit-log-arguments (quote ("--graph" "--color" "-n256")))
 '(magit-log-margin (quote (t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))
 '(magit-repository-directories
   (quote
    (("/gitlab/kinetx_glenn/design" . 0)
     ("/gitlab/kinetx_glenn/examples" . 0)
     ("/gitlab/kinetx_glenn/python" . 0)
     ("/gitlab/kinetx_python/k" . 0)
     ("/gitlab/kinetx_python/k_releases" . 0)
     ("~/.emacs.d" . 0)
     ("~/r/notes" . 0)
     ("~/r/notes.personal" . 0))))
 '(make-backup-files t)
 '(package-selected-packages
   (quote
    (wrap-region wgrep-ag wgrep web-mode visual-regexp use-package undo-tree try theme-looper swiper smex smartparens skewer-reload-stylesheets plantuml-mode paredit-menu paradox ox-clip org-plus-contrib morlock markdown-mode magit julia-shell json-mode jedi ivy-hydra ivy impatient-mode hydra hungry-delete hi2 haskell-mode git-timemachine groovy-mode ggtags fuzzy flx flycheck expand-region exec-path-from-shell elpy elisp-slime-nav ein counsel cmake-mode cmake-font-lock bash-completion base16-theme avy ag ace-window)))
 '(paradox-github-token t)
 '(plantuml-jar-path "/usr/local/bin/plantuml.jar" t)
 '(recentf-save-file "~/.emacs.d.persistent/recentf/recentf")
 '(ring-bell-function (quote ignore))
 '(save-place-mode nil)
 '(smex-save-file "~/.emacs.d.persistent/smex/smex-items")
 '(sp-show-pair-from-inside t)
 '(split-height-threshold nil)
 '(url-configuration-directory "~/.emacs.d.persistent/url/")
 '(vc-annotate-background nil)
 '(vc-make-backup-files t)
 '(version-control t)
 '(wdired-allow-to-change-permissions t t)
 '(woman-use-own-frame nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-fine-diff-B ((t (:background "dark olive green"))))
 '(popup-isearch-match ((t (:background "sky blue" :foreground "black"))))
 '(sp-show-pair-match-face ((t (:background "gray50")))))

