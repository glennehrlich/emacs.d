;;;; my-load-path.el - Set up the load-path and package system.

;; Nightly builds of emacs from http://emacsformacosx.com have this
;; set to a local build machine directory that does not exist on my
;; machine.  This is needed for things like hexl.
(if (eq system-type 'darwin)
    (progn
      (setq exec-directory "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9")
      (message "darwin detected: setting exec-directory to /Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9")))

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
                      elpy
                      exec-path-from-shell
                      expand-region
                      flx-ido
                      flycheck
                      fuzzy
                      ggtags
                      git-timemachine
                      haskell-mode
                      hi2
                      htmlize
                      ido-hacks
                      ido-ubiquitous
                      ido-vertical-mode
                      impatient-mode
                      jedi
                      js2-mode
                      json-mode
                      json-reformat
                      julia-mode
                      julia-shell
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

