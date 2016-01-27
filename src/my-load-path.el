;;;; my-load-path.el - Set up the load-path and package system.

(load-library "url-handlers")
(require 'package)

; suppress messages like "ad-handle-definition: `ido-completing-read' got redefined"
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
                      auto-complete-clang
                      avy
                      base16-theme
                      bash-completion
                      bind-key
                      cmake-mode
                      color-theme-sanityinc-tomorrow
                      darcula-theme
                      dash
                      diminish
                      dropdown-list
                      eldoc-extension
                      elisp-slime-nav
                      exec-path-from-shell
                      expand-region
                      flx-ido
                      ;; flycheck
                      fuzzy
                      ggtags
                      haskell-mode
                      hi2
                      htmlize
                      ido-hacks
                      ido-ubiquitous
                      ido-vertical-mode
                      impatient-mode
                      js2-mode
                      json-mode
                      json-reformat
                      magit
                      markdown-mode
                      morlock
                      niflheim-theme
                      noctilux-theme
                      org-plus-contrib
                      paradox
                      paredit
                      paredit-menu
                      popup
                      simple-httpd
                      skewer-mode
                      skewer-reload-stylesheets
                      smex
                      theme-looper
                      use-package
                      visual-regexp
                      web-mode
                      wrap-region
                      yasnippet
                      zerodark-theme
                      ))

;; Packages I no longer load
;; ace-jump-mode
;; geiser
;; ghc
;; ghci-completion
;; haskell-mode
;; hi2
;; key-chord

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

