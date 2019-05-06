;;;; my-load-path.el - Set up the load-path and package system.

(require 'package)

; Suppress messages from ad-handle-definition.
(setq ad-redefinition-action 'accept)

(add-to-list 'load-path "~/.emacs.d/src" t)
(setq load-path (delete-dups load-path))

(setq package-user-dir "~/.emacs.d.elpa")

(setq package-archives '(
                         ("org"       . "http://orgmode.org/elpa/")
                         ("melpa"     . "http://melpa.org/packages/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ))

(package-initialize)

(defvar my-packages '(
                      ace-window
                      ag
                      auto-complete
                      avy
                      base16-theme
                      bash-completion
                      bind-key
                      cmake-font-lock
                      cmake-mode
                      counsel
                      dash
                      diminish
                      ein
                      elisp-slime-nav
                      elpy
                      exec-path-from-shell
                      expand-region
                      flycheck
                      flx
                      fuzzy
                      ggtags
                      git-timemachine
                      groovy-mode
                      haskell-mode
                      hi2
                      htmlize
                      hydra
                      impatient-mode
                      importmagic
                      ivy
                      ivy-hydra
                      jedi
                      js2-mode
                      json-mode
                      json-reformat
                      julia-mode
                      julia-shell
                      magit
                      markdown-mode
                      morlock
                      org-plus-contrib
                      ox-clip
                      paradox
                      paredit
                      paredit-menu
                      popup
                      plantuml-mode
                      px
                      shell-pop
                      simple-httpd
                      skewer-mode
                      skewer-reload-stylesheets
                      smartparens
                      smex
                      swiper
                      theme-looper
                      try
                      undo-tree
                      use-package
                      visual-regexp
                      w3m
                      web-mode
                      wgrep
                      wgrep-ag
                      wrap-region
                      yasnippet

                      ;; Experiment with docker
                      counsel-tramp
                      docker
                      docker-compose-mode
                      docker-tramp
                      dockerfile-mode
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

