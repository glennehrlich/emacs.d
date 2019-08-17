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
                      docker-tramp
                      dockerfile-mode
                      ein
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
                      js2-mode
                      json-mode
                      json-reformat
                      magit
                      markdown-mode
                      morlock
                      org-plus-contrib
                      ox-clip
                      paradox
                      paredit
                      paredit-menu
                      plantuml-mode
                      popup
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

                      ;; python
                      ;; anaconda-mode
                      elpy

                      ;; themes
                      zerodark-theme

                      ;; term stuff
                      vterm
                      vterm-toggle
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

