;;;; custom.el - Custumization settings.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-clang-flags (quote ("-std=c++11")))
 '(ac-comphist-file "~/.emacs.d.persistent/auto-complete/ac-comphist.dat")
 '(ac-dictionary-files (quote ("~.emacs.d.persistent/auto-complete")))
 '(auto-save-list-file-prefix "~/.emacs.d.persistent/auto-save-list/saves-")
 '(blink-cursor-blinks 0)
 '(c-offsets-alist (quote ((arglist-intro . +))))
 '(column-number-mode t)
 '(comint-input-ignoredups t)
 '(compilation-scroll-output t)
 '(compilation-window-height 6)
 '(custom-enabled-themes (quote (base16-chalk)))
 '(custom-safe-themes t)
 '(delete-selection-mode t)
 '(enable-local-variables :all)
 '(fci-rule-color "#515151")
 '(font-lock-verbose nil)
 '(gdb-many-windows t)
 '(grep-files-aliases
   (quote
    (("all" . "* .*")
     ("cpp" . "*.h *.hpp *.c *.cc *.cpp *.ddl *.inl")
     ("el" . "*.el")
     ("js" . "*.js")
     ("jshtml" . "*.js *.html")
     ("julia" . "*.jl")
     ("perl" . "*.pl *.pm"))))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "for_reference_only" "oldunittest" "CMakeFiles")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*_ddl.cc" "*_ref.h" "*.min.js")))
 '(ibuffer-default-sorting-mode (quote filename/process))
 '(ibuffer-formats
   (quote
    ((mark modified read-only " "
           (name 20 20 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename))))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(magit-log-arguments (quote ("--graph" "--color" "-n256")))
 '(package-selected-packages
   (quote
    (zerodark-theme wrap-region wgrep-ag wgrep web-mode visual-regexp use-package undo-tree try theme-looper swiper smex smartparens skewer-reload-stylesheets puml-mode paredit-menu paradox org-plus-contrib noctilux-theme niflheim-theme morlock markdown-mode magit julia-shell json-mode jedi ivy impatient-mode ido-vertical-mode ido-ubiquitous ido-hacks idea-darkula-theme hungry-delete hi2 haskell-mode git-timemachine ggtags fuzzy flycheck flx-ido expand-region exec-path-from-shell elpy elisp-slime-nav eldoc-extension dropdown-list counsel cmake-mode cmake-font-lock bash-completion base16-theme avy ace-window)))
 '(paradox-github-token t)
 '(puml-plantuml-jar-path "/usr/local/bin/plantuml.jar" t)
 '(python-environment-directory "~/.emacs.d.persistent/python-environments")
 '(recentf-save-file "~/.emacs.d.persistent/recentf/recentf")
 '(save-place nil nil (saveplace))
 '(save-place-file "~/.emacs.d.persistent/save-place/emacs-places")
 '(save-place-save-skipped nil)
 '(smex-save-file "~/.emacs.d.persistent/smex/smex-items")
 '(sp-show-pair-from-inside t)
 '(split-height-threshold nil)
 '(split-width-threshold 160)
 '(tool-bar-mode nil)
 '(url-configuration-directory "~/.emacs.d.persistent/url/")
 '(use-package-verbose t)
 '(vc-annotate-background nil)
 '(vc-make-backup-files t)
 '(visual-line-mode nil t)
 '(woman-use-own-frame nil)
 '(yas-prompt-functions (quote (yas-ido-prompt yas-no-prompt))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-fine-diff-B ((t (:background "dark olive green"))))
 '(popup-isearch-match ((t (:background "sky blue" :foreground "black"))))
 '(sp-show-pair-match-face ((t (:background "gray50")))))

