;;;; init.el - Emacs initialization file.

(setq gc-cons-threshold 20000000)

; (setq debug-on-error t)
(setq debug-on-error nil)

; Suppress messages from ad-handle-definition.
(setq ad-redefinition-action 'accept)

(load (expand-file-name "src/my-load-path.el" (file-name-directory load-file-name)))

(require 'use-package)

;; These should occur before any other packages.
(use-package my-global-settings)
(use-package my-complete)

(use-package calc
  :defer t
  :init (eval-when-compile (autoload 'calc-eval-region "my-calc" nil t))
  :config (require 'my-calc))

(use-package cc-mode
  :defer t
  :mode ("\\.h\\'" . c++-mode)
  :config (require 'my-cc))

(use-package cmake-mode
  :defer t
  :config (require 'my-cmake))

(use-package compile
  :defer t
  :config (require 'my-compile))

(use-package dired
  :defer t
  :config (require 'my-dired))

(use-package ediff
  :defer t
  :config (require 'my-ediff))

(use-package elisp-mode
  :defer t
  :config (require 'my-elisp))

(use-package eshell
  :defer t
  :config (require 'my-eshell))

(use-package ggtags
  :defer t
  :config (require 'my-ggtags))

(use-package git-timemachine
  :defer t
  :config (require 'my-git-timemachine))

(use-package grep
  :defer t
  :config (require 'my-grep))

(use-package groovy-mode
  :defer t)

(use-package haskell-mode
  :defer t
  :config (require 'my-haskell))

(use-package ivy
  :config (require 'my-ivy))

(use-package json-mode
  :defer t
  :mode "\\.czml\\'")

(use-package lisp-mode
  :defer t
  :config (require 'my-lisp))

(use-package markdown-mode
  :defer t
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package magit
  :defer t
  :config (require 'my-magit))

(use-package my-backup)

(use-package my-key-bindings)

(use-package my-local)

;; plantuml-mode calls the plantuml jar file when byte compiling and on
;; first load, hence the jar location has to be set before plantuml-mode
;; is loaded or compiled. Unfortunately, this can not be done in
;; custom.el.
(eval-and-compile (customize-set-variable 'plantuml-jar-path "/usr/local/bin/plantuml.jar"))
(use-package plantuml-mode
  :defer t
  :mode ("\\.puml\\'" . plantuml-mode))

(use-package my-undo-tree)

(use-package theme-looper
  :defer t
  :config (require 'my-theme-looper))

;; glenn: commented out because paredit creates a binding for
;; M-<delete> that for some reason I can't override globally (I want
;; M-<delete> to be magit-list-repositories instead). As I hardly ever
;; edit lisp code anymore and smartparens seems to be working on in
;; lisp code, I'm tentatively not using paredit mode.
;;
;; At some point, permamently delete this and my-paredit.el.
;; (use-package paredit
;;   :init (require 'my-paredit))

;; Only load python package on non red hat systems (currently assuming
;; that red hat systems will not have full python environments).
(use-package python
  :if (not (file-exists-p "/etc/redhat-release"))
  :defer t
  :config (require 'my-python))

(use-package org
  :defer t
  :config (require 'my-org))

(use-package shell
  :defer t
  :config (require 'my-shell))

(use-package shell-here
  :defer t)

(use-package smartparens-config
  :config (require 'my-smartparens))

(use-package subword
  :if (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  :diminish subword-mode
  :config (global-subword-mode 1))

(use-package visual-regexp
  :defer t)

(use-package winner
  :config (winner-mode 1))

(use-package yasnippet
  :defer t
  :config (require 'my-yas))

;; Mac.
(use-package my-darwin
  :if (eq system-type 'darwin))

;;; These must appear last because they may rebind keys that are set
;;; in my-key-bindings.el

;; Linux.
(use-package my-linux
  :if (eq system-type 'gnu/linux))

;; Windows
(use-package my-windows
  :if (eq system-type 'windows-nt))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

