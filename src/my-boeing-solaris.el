;;;; my-boeing-solaris.el - Customizations for running emacs on solaris at boeing.

(require 'my-boeing-common)

(set-scroll-bar-mode 'right)

(defvar dired-use-ls-dired)
(setq dired-use-ls-dired nil)

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

(provide 'my-boeing-solaris)

