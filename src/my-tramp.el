;; -*- lexical-binding: t -*-
;;;; my-tramp.el - Customizations for tramp.

(require 'tramp-cache)

(customize-set-variable 'tramp-persistency-file-name "~/.emacs.d.persistent/tramp/tramp")

;; Use the remote user's PATH. See
;; https://www.gnu.org/software/emacs/manual/html_node/tramp/Remote-programs.html
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(provide 'my-tramp)

