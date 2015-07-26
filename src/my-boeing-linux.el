;;;; my-boeing-linux.el - Customizations for running emacs on linux at boeing.

(require 'bash-completion)
(require 'my-boeing-common)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 105
                    :weight 'normal)

;; (set-face-attribute 'default nil
;;                     :family "FreeMono"
;;                     :height 106)

;; (set-face-attribute 'default nil
;;                     :family "Segoe UI"
;;                     :height 120)

(bash-completion-setup)

(global-set-key (kbd "<pause>")   'magit-status)                   ; Boeing linux; overrides theme-looper-enable-next-theme
(global-set-key (kbd "<M-pause>") 'theme-looper-enable-next-theme) ; Boeing linux

(provide 'my-boeing-linux)

