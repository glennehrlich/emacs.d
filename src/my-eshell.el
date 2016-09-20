;;;; my-eshell.el - Customizations for eshell mode.

(require 'eshell)
(require 'em-hist)

;; For some reason, quitting an eshell buffer without having dired
;; loaded causes an undefined symbol error on dired-get-filename.  A
;; stack trace shows this actually comes from ido doing something, but
;; it's triggered by eshell, so I'm fixing this by loading dired when
;; eshell is loadd.
(require 'dired)

(customize-set-variable 'eshell-aliases-file "~/.emacs.d/eshell-alias")
(customize-set-variable 'eshell-directory-name "~/.emacs.d.persistent/eshell/")
(customize-set-variable 'eshell-hist-ignoredups t)
(customize-set-variable 'eshell-save-history-on-exit nil)

(defun eshell-truncate-buffer-all ()
  "Truncate the buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))

(add-hook 'eshell-mode-hook
          (lambda ()
            ;; These have to be done in a hook because
            ;; eshell-command-map is a buffer local variable.  It's
            ;; apparently not supposed to be and appears to to be a
            ;; bug in the way eshell is implemented.
            (define-key eshell-command-map (kbd "SPC") nil) ;; unbind so that C-c SPC can be used for ace-jump-mode
            (define-key eshell-command-map (kbd "C-t") 'eshell-truncate-buffer-all)
            (define-key eshell-command-map (kbd "M-o") 'eshell-truncate-buffer-all)
            ))

(defun my-eshell-post-command-hook ()
  "Append to the history file after each command.

Set `eshell-save-history-on-exit' to nil when using this hook."
  (and eshell-history-file-name
       (not (ring-empty-p eshell-history-ring))
       (write-region (concat (ring-ref eshell-history-ring 0) "\n")
                     nil
                     eshell-history-file-name
                     t
                     'no-message)))
(add-hook 'eshell-post-command-hook 'my-eshell-post-command-hook)

(provide 'my-eshell)

