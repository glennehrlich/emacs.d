;;;; my-xref.el - Customizations for xref.


(require 'global-tags)
(require 'ivy-xref)
(require 'project)
(require 'xref)

(add-to-list 'xref-backend-functions 'global-tags-xref-backend)

;; xref initialization is different in Emacs 27 - there are two different
;; variables which can be set rather than just one
(when (>= emacs-major-version 27)
  (setq xref-show-definitions-function #'ivy-xref-show-defs))

;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
;; commands other than xref-find-definitions (e.g. project-find-regexp)
;; as well
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs)

(add-to-list 'project-find-functions 'global-tags-try-project-root)

(provide 'my-xref)

