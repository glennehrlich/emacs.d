;;;; custom.el - Custumization settings.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-clang-flags '("-std=c++11") t)
 '(ac-comphist-file "~/.emacs.d.persistent/auto-complete/ac-comphist.dat")
 '(ac-dictionary-files '("~/.emacs.d.persistent/auto-complete"))
 '(auto-save-list-file-prefix "~/.emacs.d.persistent/auto-save-list/saves-")
 '(backup-by-copying t)
 '(backup-directory-alist '(("." . "~/backups/emacs")))
 '(blink-cursor-blinks 0)
 '(c-offsets-alist '((arglist-intro . c-lineup-arglist-intro-after-paren)))
 '(calc-settings-file "~/.emacs.d/calc-settings.el")
 '(comint-input-ignoredups t)
 '(compilation-scroll-output t)
 '(compilation-window-height 6)
 '(counsel-ag-base-command "ag --hidden --ignore .git --nocolor --nogroup %s")
 '(counsel-find-file-at-point t)
 '(counsel-mode-override-describe-bindings t)
 '(counsel-rg-base-command
   "rg --hidden --glob !.git -S --no-heading --line-number --color never %s .")
 '(counsel-yank-pop-separator "
----
")
 '(custom-enabled-themes '(zerodark))
 '(custom-safe-themes t)
 '(default-frame-alist '((width . 100) (height . 60)))
 '(delete-old-versions t)
 '(dired-dwim-target t)
 '(dired-kept-versions 2)
 '(docker-tramp-use-names t)
 '(enable-local-variables :all)
 '(eshell-aliases-file "~/.emacs.d/eshell-alias")
 '(eshell-directory-name "~/.emacs.d.persistent/eshell/")
 '(eshell-hist-ignoredups t)
 '(eshell-history-file-name "~/.emacs.d.persistent/eshell/history")
 '(eshell-save-history-on-exit nil)
 '(gdb-many-windows t)
 '(ggtags-global-abbreviate-filename nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(ivy-count-format "%d/%d ")
 '(ivy-use-selectable-prompt t)
 '(kept-new-versions 10)
 '(kept-old-versions 10)
 '(magit-log-arguments '("--graph" "--color" "-n256") t)
 '(magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
 '(magit-repolist-column-flag-alist
   '((magit-untracked-files . "+")
     (magit-unstaged-files . "*")
     (magit-staged-files . "S")))
 '(make-backup-files t)
 '(org-clock-into-drawer nil)
 '(org-clock-persist t)
 '(org-clock-persist-file "~/.emacs.d.persistent/org/org-clock-save.el")
 '(org-duration-format '(("h") (special . 2)) t)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     (directory . emacs)))
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.4 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-return-follows-link t)
 '(org-startup-folded t)
 '(org-startup-indented t)
 '(org-table-use-standard-references t)
 '(org-todo-keywords '((sequence "TODO" "WORKING" "|" "DONE" "CANCELLED")))
 '(package-selected-packages
 '(xterm-color wrap-region wgrep-ag wgrep web-mode w3m vterm visual-regexp use-package undo-tree try theme-looper swiper string-edit smex smartparens skewer-reload-stylesheets shell-pop restclient plantuml-mode paredit-menu paradox ox-clip org-plus-contrib morlock maven-test-mode markdown-mode marcopolo magit-gitflow magit json-mode jedi ivy-hydra ivy importmagic impatient-mode hydra hungry-delete hi2 git-timemachine ggtags fuzzy flx flycheck expand-region exec-path-from-shell elpy elisp-slime-nav el-patch ein dockerfile-mode docker-tramp docker-compose-mode docker-cli docker-api docker default-text-scale counsel-tramp counsel company cmake-mode cmake-font-lock bash-completion avy async ace-window))
 '(paradox-github-token t)
 '(recentf-save-file "~/.emacs.d.persistent/recentf/recentf")
 '(request-storage-directory "~/.emacs.d.transient/request")
 '(ring-bell-function 'ignore)
 '(save-place-mode nil)
 '(shell-pop-shell-type '("vterm" "*vterm*" (lambda nil (vterm))))
 '(shell-pop-universal-key "C-t")
 '(smex-save-file "~/.emacs.d.persistent/smex/smex-items")
 '(sp-show-pair-from-inside t)
 '(split-height-threshold nil)
 '(tramp-persistency-file-name nil)
 '(transient-history-file "~/.emacs.d.transient/history.el")
 '(url-configuration-directory "~/.emacs.d.persistent/url/")
 '(vc-annotate-background nil)
 '(vc-follow-symlinks t)
 '(vc-make-backup-files t)
 '(version-control t)
 '(vterm-always-compile-module t)
 '(vterm-clear-scrollback-when-clearing t)
 '(vterm-max-scrollback 100000)
 '(wdired-allow-to-change-permissions t)
 '(woman-use-own-frame nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "#c678dd" :weight bold :height 2.0))))
 '(ivy-current-match ((t (:background "#282c34" :foreground "#c678dd" :box (:line-width 1 :color "#c678dd") :weight normal))))
 '(sp-show-pair-match-face ((t (:background "gray50"))))
 '(term-color-green ((t (:background "#98be65"))))
 '(term-color-red ((t (:background "#ff6c6b")))))
