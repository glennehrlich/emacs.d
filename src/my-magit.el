;;;; my-magit.el - Customizations for magit mode.

(require 'magit)

(customize-set-variable 'magit-log-arguments '("--graph" "--color" "-n256"))

(setq magit-completing-read-function 'ivy-completing-read)

;; The list of repositories reported by magit-list-repositories, bound
;; to M-<delete> in my-key-bindings.el.

;; Additional repositories can be added over time.
;;
;; To get a list of git repositories in the system, execute
;;
;; $ find / -name .git
;;
;; or to find all regardless of permissions
;;
;; $ sudo find / -name .git
(customize-set-variable 'magit-repository-directories
                        '(
                          ("/gitlab/kinetx_glenn/design" . 0)
                          ("/gitlab/kinetx_glenn/examples" . 0)
                          ("/gitlab/kinetx_glenn/python" . 0)
                          ("/gitlab/kinetx_python/k" . 0)
                          ("/gitlab/kinetx_python/k_releases" . 0)
                          ("~/.emacs.d" . 0)
                          ("~/r/notes" . 0)
                          ("~/r/notes.personal" . 0)
                          ))

(provide 'my-magit)

