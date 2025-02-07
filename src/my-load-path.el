;; -*- lexical-binding: t -*-
;;;; my-load-path.el - Set up the load-path and package system.

(require 'cl-lib)
(require 'package)

;; Don't turn off native compilation warnings but this should suppress
;; popping them up in a warnings buffer.
(customize-set-variable 'native-comp-async-report-warnings-errors 'silent)

;; Native compile packages when installing them.
(customize-set-variable 'package-native-compile t)

;; Upgrade packages from archives even if they come with emacs. This
;; is mostly for getting newer version of org.
(customize-set-variable 'package-install-upgrade-built-in t)

;; Suppress messages from ad-handle-definition.
(setq ad-redefinition-action 'accept)

;; Don't prompt to compile vterm-module.
(customize-set-variable 'vterm-always-compile-module t)

(add-to-list 'load-path "~/.emacs.d/src" t)
(setq load-path (delete-dups load-path))

(setq package-user-dir "~/.emacs.d.elpa")

;; Force package-gnupghome-dir to be in ~/.emacs.d.elpa instead of
;; ~/.emacs.d/elpa.
(when (boundp 'package-gnupghome-dir)
  (setq package-gnupghome-dir
         (expand-file-name "gnupg" package-user-dir)))

;; Re-order the emacs package archives.
(setq package-archives '(("melpa"  . "https://melpa.org/packages/")
                         ("elpa"   . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("gnu"    . "https://elpa.gnu.org/packages/")))

(package-initialize)

(defvar my-packages '(
                      ;; These have to be done first.

                      ace-window
                      async
                      auto-complete
                      avy
                      bash-completion
                      cmake-font-lock
                      cmake-mode
                      company
                      counsel
                      counsel-tramp
                      dash
                      default-text-scale
                      diminish
                      docker
                      docker-compose-mode
                      dockerfile-mode
                      ein
                      el-patch
                      elisp-slime-nav
                      exec-path-from-shell
                      expand-region
                      flx
                      flycheck
                      fuzzy
                      ggtags
                      git-timemachine
                      hi2
                      htmlize
                      hydra
                      impatient-mode
                      importmagic
                      ivy
                      ivy-hydra
                      jedi
                      jsonian
                      magit
                      markdown-mode
                      maven-test-mode
                      morlock
                      org ;; this doesn't really work, need to manually install with list-packages
                      org-contrib
                      ox-clip
                      paradox
                      paredit
                      paredit-menu
                      plantuml-mode
                      popup
                      px
                      restclient
                      shell-pop
                      simple-httpd
                      skewer-mode
                      skewer-reload-stylesheets
                      smartparens
                      smex
                      string-edit
                      swiper
                      theme-looper
                      try
                      undo-tree
                      unfill
                      use-package
                      visual-regexp
                      vterm
                      vterm-toggle
                      w3m
                      web-mode
                      wgrep
                      wgrep-ag
                      wrap-region
                      xterm-color
                      yasnippet

                      ;; themes
                      color-theme-sanityinc-solarized
                      color-theme-sanityinc-tomorrow
                      doom-themes
                      solarized-theme
                      spacemacs-theme
                      zenburn-theme
                      zerodark-theme
                      ))

(defun get-my-packages ()
  "Get all packages listed in the `my-packages' variable."
  (interactive)

  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(get-my-packages)

(provide 'my-load-paths)

