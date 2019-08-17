;;;; my-grep.el - Customizations for grep commands.

(require 'grep)

;;; Note that lgrep and variants do not work very well with ivy, as
;;; you can not read a file pattern alias when ivy is active. Best
;;; alternative is to use counsel-ag.

(dolist (files-alias '(("cpp" . "*.h *.hpp *.c *.cc *.cpp *.ddl *.inl")
                       ("js" . "*.js")
                       ("jshtml" . "*.js *.html")
                       ("julia" . "*.jl")
                       ("perl" . "*.pl *.pm")))
  (add-to-list 'grep-files-aliases files-alias))

(dolist (ignored-directory '(".git"
                             "for_reference_only"
                             "oldunittest"
                             "CMakeFiles"))
  (add-to-list 'grep-find-ignored-directories ignored-directory))

(dolist (ignored-file '("*_ddl.cc"
                        "*_ref.h"
                        "*.min.js"
                        ))
  (add-to-list 'grep-find-ignored-files ignored-file))

(provide 'my-grep)

