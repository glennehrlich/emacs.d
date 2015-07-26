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
(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-copy-env "INFOPATH")
(exec-path-from-shell-copy-env "MANPATH")
(exec-path-from-shell-copy-env "EMACS")
(exec-path-from-shell-copy-env "EDITOR")
(exec-path-from-shell-copy-env "VISUAL")
(exec-path-from-shell-copy-env "PLTCOLLECTS")

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 140
                    :weight 'light)

;; (set-face-attribute 'default nil
;;                     :family "FreeMono"
;;                     :height 140)

;; (set-face-attribute 'default nil
;;                     :family "Courier"
;;                     :height 140)

;; (set-face-attribute 'default nil
;;                     :family "Segoe UI"
;;                     :height 160)

(bash-completion-setup)

(provide 'my-darwin)

