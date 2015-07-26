;;;; my-linux.el - Customizations for running emacs on linux.

(require 'bash-completion)

(defvar browse-url-chromium-program "/opt/google/chrome/chrome")

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 105
                    :weight 'medium)

;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro"
;;                     :height 105
;;                     :weight 'light)

;; (set-face-attribute 'default nil
;;                     :family "FreeMono"
;;                     :height 106)

;; (set-face-attribute 'default nil
;;                     :family "Segoe UI"
;;                     :height 120)

(bash-completion-setup)

(provide 'my-linux)

