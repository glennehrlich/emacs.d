;;;; my-backup.el - Customizations for backing up files.

(customize-set-variable 'backup-by-copying t)
(customize-set-variable 'backup-directory-alist '(("." . "~/r/backups/emacs")))
(customize-set-variable 'delete-old-versions t)
(customize-set-variable 'dired-kept-versions 2)
(customize-set-variable 'kept-new-versions 10)
(customize-set-variable 'kept-old-versions 10)
(customize-set-variable 'make-backup-files t)
(customize-set-variable 'version-control t)

(add-hook 'before-save-hook
          (lambda ()
            "Force backup to occur on every save."
            (setq buffer-backed-up nil)))

(provide 'my-backup)

