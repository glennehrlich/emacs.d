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
                          ;; (<dir>           . <depth>)
                          ("~/.aws"           . 0)
                          ("~/.emacs.d"       . 0)
                          ("~/.ssh"           . 0)
                          ("~/bin"            . 0)
                          ("~/dot-files"      . 0)
                          ("~/gitlab"         . 6)
                          ("~/notes"          . 0)
                          ("~/notes-personal" . 0)
                          ("~/todo"           . 0)
                          ))

(customize-set-variable 'magit-repolist-columns
                        '(
                          ("D"        1 magit-repolist-column-dirty nil)
                          ("S"        1 magit-repolist-column-stashes nil)
                          ("B<U"      3 magit-repolist-column-unpulled-from-upstream ((:right-align t)
                                                                                      (:help-echo "Upstream changes not in branch")))
                          ("B>U"      3 magit-repolist-column-unpushed-to-upstream ((:right-align t)
                                                                                    (:help-echo "Local changes not in upstream")))
                          ("Branch"  20 magit-repolist-column-branch nil)
                          ("Name"    40 magit-repolist-column-ident nil)
                          ;; ("Version" 25 magit-repolist-column-version nil)
                          ("Path"    99 magit-repolist-column-path nil)
                          ))

(provide 'my-magit)

