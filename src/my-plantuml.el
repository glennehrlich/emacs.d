;;;; my-plantuml.el - Customizations for plantuml mode.

(require 'plantuml-mode)
(require 'org)
(require 'ob-plantuml)

(customize-set-variable 'plantuml-output-type "png")

(eval-and-compile (customize-set-variable 'plantuml-jar-path "/usr/local/bin/plantuml.jar"))
(eval-and-compile (customize-set-variable 'plantuml-default-exec-mode 'jar))

(add-hook 'plantuml-mode-hook
          (lambda ()
            ;; Fix indentation of using "return" or "return foo" in
            ;; sequence diagrams to make them act like deactivate.
            (defvar ge-plantuml-indent-regexp-return-end "^\s*return\s*.*$")
            (defvar plantuml-indent-regexp-end)
            (add-to-list 'plantuml-indent-regexp-end ge-plantuml-indent-regexp-return-end)))

;; Babel support
(add-to-list 'org-structure-template-alist '("p" . "src plantuml :file DIAGRAM.png"))

(customize-set-variable 'org-plantuml-jar-path plantuml-jar-path)

(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))

(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
         '((plantuml . t))))

(provide 'my-plantuml)

