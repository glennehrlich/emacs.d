;; -*- lexical-binding: t -*-
;;;; init.el - Emacs initialization file.

;; Don't turn off native compilation warnings but this should suppress
;; popping them up in a warnings buffer.
(customize-set-variable 'native-comp-async-report-warnings-errors 'silent)

;; Native compile packages when installing them.
(customize-set-variable 'package-native-compile t)

(setq gc-cons-threshold 20000000)

; (setq debug-on-error t)
(setq debug-on-error nil)

; Make sure to start up in home directory.
(cd "~")

; Suppress messages from ad-handle-definition.
(setq ad-redefinition-action 'accept)

(load (expand-file-name "src/my-load-path.el" (file-name-directory load-file-name)))

(require 'use-package)

;; These should occur before any other packages.
(use-package my-global-settings)
(use-package my-complete)
(use-package el-patch)

;; Have to manually require this because use-package doesn't know that
;; java-mode is a derived mode of cc-mode.
(require 'my-java)

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

(use-package company
  :defer t
  :config (require 'my-company))

(use-package dired
  :defer t
  :config (require 'my-dired))

;; obsolete, need to incorporate this functionality using tramp-container
;; (use-package docker-tramp
;;   :defer t
;;   :config (require 'my-docker-tramp))

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

(use-package ivy
  :config (require 'my-ivy))

(use-package jsonian
  :defer t)

(use-package lisp-mode
  :defer t
  :config (require 'my-lisp))

(use-package markdown-mode
  :defer t
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

;; magit needs an :init to require 'my-magit before actually loading
;; magit due to how lazy loading messes up usage of the function
;; magit-list-repossitories. The issue was that
;; magit-repository-directories was not being set before
;; magit-list-repositories decided to run if a :config form was used
;; instead.
(use-package magit
  :defer t
  :init (require 'my-magit))

(use-package my-backup)

(use-package my-key-bindings)

(use-package my-local)

(use-package plantuml-mode
  :defer t
  :mode ("\\.puml\\'" . plantuml-mode)
  :config (require 'my-plantuml))

(use-package my-undo-tree)

(use-package restclient
  :ensure t
  :defer t
  :mode (("\\.http\\'" . restclient-mode))
  :bind (:map restclient-mode-map
	      ("C-c C-f" . json-mode-beautify)))

(use-package theme-looper
  :config (require 'my-theme-looper))

(use-package python
  :defer t
  :mode ("\\.py[iw]?\\'" . python-ts-mode)
  :config (require 'my-python))

(use-package org
  :defer t
  :config (require 'my-org))

(use-package shell
  :defer t
  :config (require 'my-shell))

(use-package shell-pop
  :defer t
  :config (require 'my-shell-pop))

(use-package smartparens-config
  :config (require 'my-smartparens))

(use-package subword
  :if (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  :diminish subword-mode
  :config (global-subword-mode 1))

(use-package tramp
  :defer t
  :config (require 'my-tramp))

(use-package visual-regexp
  :defer t)

;; Needs to be loaded directory for shell-pop to work (i.e., vterm can
;; not be lazily loaded).
(use-package vterm
  :config (require 'my-vterm))

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

;;; Patches
;;;
;;; This section uses el-patch-defun or other el-patch functions to
;;; make patches to fix things. Even if there are no active patches,
;;; keep this section in order to remind me where to do patches.
;;;
;;; See commit 67c192acfe330bff7213abcea837897a9770f1ca for an example
;;; patch (copy the commit id and M-x magit-show-commit).

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

