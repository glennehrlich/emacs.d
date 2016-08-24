;;;; init.el - Emacs initialization file.

(setq gc-cons-threshold 20000000)

;; (setq debug-on-error t)
(setq debug-on-error nil)

; suppress messages like "ad-handle-definition: `ido-completing-read' got redefined"
(setq ad-redefinition-action 'accept)

(load (expand-file-name "src/my-load-path.el" (file-name-directory load-file-name)))

(require 'use-package)

;; Setting up auto completion should occur before other modes.
(use-package my-complete)

(use-package calc
  :commands (calc quick-calc calc-eval-region)
  :init (eval-when-compile (autoload 'calc-eval-region "my-calc" nil t))
  :config (require 'my-calc))

(use-package cc-mode
  :defer t
  :mode ("\\.h\\'" . c++-mode)
  :config (require 'my-cc))

(use-package cmake-mode
  :defer t
  :config (require 'my-cmake))

(use-package eshell
  :defer t
  :config (require 'my-eshell))

(use-package ggtags
  :defer t
  :config (require 'my-ggtags))

(use-package git-timemachine
  :defer t
  :config (require 'my-git-timemachine))

;; Can not use use-package because of warnings.
(with-no-warnings (require 'my-ido))

(use-package haskell-mode
  :defer t
  :config (require 'my-haskell))

(use-package hungry-delete
  :ensure t
  :diminish hungry-delete-mode
  :config (global-hungry-delete-mode))

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

(use-package ediff
  :defer t
  :config (require 'my-ediff))

;; Elisp is special and needs both :commands and :init.
;; 2015/01/06: error with flycheck prevents this from loading.
(use-package elisp-mode
  :defer t
  :config (require 'my-elisp))
;; (use-package emacs-lisp-mode
;;   :commands (emacs-lisp-mode)
;;   :init (require 'my-elisp))

(use-package magit
  :defer t
  :config (require 'my-magit))

(use-package my-backup)

(use-package my-key-bindings)

(use-package my-local)

;; puml-mode calls the plantuml jar file when byte compiling and on
;; first load, hence the jar location has to be set before puml-mode
;; is loaded or compiled. Unfortunately, this can not be done in
;; custom.el.
(eval-and-compile (customize-set-variable 'puml-plantuml-jar-path "/usr/local/bin/plantuml.jar"))
(use-package puml-mode
  :defer t
  :mode ("\\.puml\\'" . puml-mode))

(use-package my-undo-tree)

(use-package my-windows
  :if (eq system-type 'windows-nt))

(use-package theme-looper
  :defer t
  :config (require 'my-theme-looper))

(use-package paredit
  :init (require 'my-paredit))

(use-package python
  :defer t
  :config (require 'my-python))

(use-package org
  :defer t
  :config (require 'my-org))

(use-package shell
  :defer t
  :config (require 'my-shell))

(use-package smartparens-config
  :config (require 'my-smartparens))

(use-package subword
  :if (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  :diminish subword-mode
  :config (global-subword-mode 1))

(use-package visual-regexp
  :commands (vr/replace vr/query-replace))

(use-package winner
  :config (winner-mode 1))

(eval-when-compile (autoload 'yas "my-yas" nil t))
(use-package my-yas
  :commands (yas))

;; Mac.
(use-package my-darwin
  :if (eq system-type 'darwin))

;;; These must appear last because they may rebind keys that are set
;;; in my-key-bindings.el

;; Normal linux running on parallels.
(use-package my-linux
  :if (and (eq system-type 'gnu/linux)
           (not (getenv "BOEING_LINUX"))))

;; Boeing linux.
(use-package my-boeing-linux
  :if (and (eq system-type 'gnu/linux)
           (getenv "BOEING_LINUX")))

;; Boeing solaris.
(use-package my-boeing-solaris
  :if (eq system-type 'usg-unix-v))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

