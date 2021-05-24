;;;; my-magit.el - Customizations for magit mode.

(require 'magit)
(require 'magit-gitflow)

(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

(customize-set-variable 'magit-log-arguments '("--graph" "--color" "-n256"))

(setq magit-completing-read-function 'ivy-completing-read)

;; Add git repos to be tracked with magit-list-repositories.
(defun add-to-magit-repository-directories (dir-depth)
  (when (file-directory-p (car dir-depth)) ; only add if directory exists
    (add-to-list 'magit-repository-directories dir-depth t)))
(add-to-magit-repository-directories '("~/.emacs.d"  . 10))
(add-to-magit-repository-directories '("~/bin"       . 10))
(add-to-magit-repository-directories '("~/dot-files" . 10))
(add-to-magit-repository-directories '("~/g"         . 10))
(add-to-magit-repository-directories '("~/git"       . 10))
(add-to-magit-repository-directories '("~/glenn-bin" . 10))
(add-to-magit-repository-directories '("~/notes"     . 10))
(add-to-magit-repository-directories '("~/todo"      . 10))

(customize-set-variable 'magit-repolist-columns
                        '(
                          ("S"        1 magit-repolist-column-flag nil)
                          ("↓"        1 magit-repolist-column-unpulled-from-upstream ((:help-echo "Upstream changes not in branch")))
                          ("↑"        1 magit-repolist-column-unpushed-to-upstream ((:help-echo "Local changes not in upstream")))
                          ("Branch"  25 magit-repolist-column-branch nil)
                          ("Path"    99 magit-repolist-column-path nil)
                          ))

(customize-set-variable 'magit-repolist-column-flag-alist
                        '(
                          (magit-untracked-files . "+")
                          (magit-unstaged-files  . "*")
                          (magit-staged-files    . "S")
                          ))

(provide 'my-magit)

