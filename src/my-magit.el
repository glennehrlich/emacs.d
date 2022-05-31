;;;; my-magit.el - Customizations for magit mode.

(require 'magit)
(require 'magit-gitflow)

;; Add git repos to be tracked with magit-list-repositories.
(defun add-to-magit-repository-directories (dir-depth)
  (when (file-directory-p (car dir-depth)) ; only add if directory exists
    (add-to-list 'magit-repository-directories dir-depth t)))
(add-to-magit-repository-directories '("~/.emacs.d"       . 10))
(add-to-magit-repository-directories '("~/bin"            . 10))
(add-to-magit-repository-directories '("~/dot-files"      . 10))
(add-to-magit-repository-directories '("~/g"              . 10))
(add-to-magit-repository-directories '("~/git"            . 10))
(add-to-magit-repository-directories '("~/glenn-bin"      . 10))
(add-to-magit-repository-directories '("~/notes"          . 10))
(add-to-magit-repository-directories '("~/notes-personal" . 10))
(add-to-magit-repository-directories '("~/todo"           . 10))

(customize-set-variable 'magit-repolist-columns
                        '(
                          ("S"       1 magit-repolist-column-flag nil)
                          ("U↓"      2 magit-repolist-column-unpulled-from-upstream nil)
                          ("U↑"      2 magit-repolist-column-unpushed-to-upstream nil)
                          ("P↓"      2 magit-repolist-column-unpulled-from-pushremote nil)
                          ("P↑"      2 magit-repolist-column-unpushed-to-pushremote nil)
                          ("Branch" 90 magit-repolist-column-branch nil)
                          ("Path"   99 magit-repolist-column-path nil)
                          ))

(customize-set-variable 'magit-repolist-column-flag-alist
                        '(
                          (magit-untracked-files . "+")
                          (magit-unstaged-files  . "*")
                          (magit-staged-files    . "S")
                          ))

(provide 'my-magit)

