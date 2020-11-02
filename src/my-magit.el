;;;; my-magit.el - Customizations for magit mode.

(require 'magit)
(require 'magit-gitflow)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

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
                          ("~"           . 10)
                          ))

(customize-set-variable 'magit-repolist-columns
                        '(
                          ("S"        1 magit-repolist-column-flag nil)
                          ("↓"        1 magit-repolist-column-unpulled-from-upstream ((:help-echo "Upstream changes not in branch")))
                          ("↑"        1 magit-repolist-column-unpushed-to-upstream ((:help-echo "Local changes not in upstream")))
                          ("Branch"  10 magit-repolist-column-branch nil)
                          ("Path"    99 magit-repolist-column-path nil)
                          ))

(customize-set-variable 'magit-repolist-column-flag-alist
                        '(
                          (magit-untracked-files . "+")
                          (magit-unstaged-files  . "*")
                          (magit-staged-files    . "S")
                          ))

(provide 'my-magit)

