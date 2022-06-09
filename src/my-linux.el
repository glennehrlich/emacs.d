;;;; my-linux.el - Customizations for running emacs on linux.

(require 'bash-completion)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 168
                    :weight 'medium)

(customize-set-variable 'default-frame-alist '((width  . 100)
                                               (height .  60)))

(bash-completion-setup)

;; Add "v" to dired-listing-switches if it is not already present to
;; make dired sort like it does in Mac OS X (dot files all first).
(unless (string-match "[v]" dired-listing-switches)
  (setq dired-listing-switches (concat dired-listing-switches "v")))

(provide 'my-linux)

