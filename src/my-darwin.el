;;;; my-darwin.el - Customizations for running emacs on stock gnu emacs build for mac.

(require 'bash-completion)
(require 'ns-win nil t)

;; Need both to avoid warning and have it be set properly.
(defvar mac-command-modifier)
(defvar mac-option-modifier)
(defvar mac-right-control-modifier)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-right-control-modifier 'hyper)

(defvar dired-use-ls-dired)
(setq dired-use-ls-dired nil)

(defvar browse-url-chromium-program "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")

(require 'exec-path-from-shell)
(add-to-list 'exec-path-from-shell-variables "INFOPATH")
(add-to-list 'exec-path-from-shell-variables "MANPATH")
(add-to-list 'exec-path-from-shell-variables "EMACS")
(add-to-list 'exec-path-from-shell-variables "EDITOR")
(add-to-list 'exec-path-from-shell-variables "VISUAL")
(exec-path-from-shell-initialize)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 140
                    :weight 'light)

(bash-completion-setup)

(provide 'my-darwin)

