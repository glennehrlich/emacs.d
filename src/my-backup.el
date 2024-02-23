;; -*- lexical-binding: t -*-
;;;; my-backup.el - Customizations for backing up files.

(add-hook 'before-save-hook
          (lambda ()
            "Force backup to occur on every save."
            (setq buffer-backed-up nil)))

(provide 'my-backup)

