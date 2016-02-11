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

;; (use-package ess-site
;;   :defer t
;;   :commands julia)

;; Can not use use-package because of warnings.
(with-no-warnings (require 'my-ido))

(eval-when-compile (autoload 'gid "idutils" nil t))
(use-package idutils
  :commands (gid))

(use-package haskell-mode
  :defer t
  :config (require 'my-haskell))

(use-package key-chord
  :disabled t
  :init (key-chord-mode 1))

(use-package lisp-mode
  :defer t
  :config (require 'my-lisp))

(use-package markdown-mode
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package my-backup)

(use-package my-ediff)

;; Elisp is special and needs both :commands and :init.
;; 2015/01/06: error with flycheck prevents this from loading.
(use-package my-elisp)
;; (use-package emacs-lisp-mode
;;   :commands (emacs-lisp-mode)
;;   :init (require 'my-elisp))

(use-package my-key-bindings)

(use-package my-local)

(use-package my-magit)

(use-package my-windows
  :if (eq system-type 'windows-nt))

(use-package my-theme-looper)

(use-package org
  :defer t
  :config (require 'my-org))

(use-package paredit
  :init (require 'my-paredit))

(use-package shell
  :defer t
  :config (require 'my-shell))

(use-package subword
  :if (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  :diminish subword-mode
  :init (global-subword-mode 1))

(use-package visual-regexp
  :commands (vr/replace vr/query-replace))

(use-package winner
  :init (winner-mode 1))

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

