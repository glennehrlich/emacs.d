;; -*- lexical-binding: t -*-
;;;; my-xref.el - Customizations for ivy-xref mode.

(require 'ivy-xref)
(require 'xref)

(customize-set-variable 'xref-show-definitions-function #'ivy-xref-show-defs)
(customize-set-variable 'xref-show-xrefs-function #'ivy-xref-show-xrefs)

;; M-. is already usually set to a mode-specific "find definitions" function.
(global-set-key (kbd "C-.") 'xref-find-references)

(provide 'my-xref)
