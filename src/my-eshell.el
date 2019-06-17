;;;; my-eshell.el - Customizations for eshell mode.

(require 'bash-completion)
(require 'counsel)
(require 'em-cmpl)
(require 'em-dirs)
(require 'em-hist)
(require 'em-term)

(customize-set-variable 'eshell-aliases-file "~/.emacs.d/eshell-alias")
(customize-set-variable 'eshell-directory-name "~/.emacs.d.persistent/eshell/")
(customize-set-variable 'eshell-hist-ignoredups t)
(customize-set-variable 'eshell-history-file-name "~/.emacs.d.persistent/eshell/history")
(customize-set-variable 'eshell-save-history-on-exit nil)

(customize-set-variable 'eshell-visual-commands
                        (append eshell-visual-commands
                                '(
                                  "mgitstatus"
                                  "git_status.sh"
                                  )))

(customize-set-variable 'eshell-visual-options
                        (append eshell-visual-options
                                '(
                                  ("docker" "build" "pull" "push")
                                  )))

;; This is the same function as in em-prompt.el except that a newline
;; is added.
(customize-set-variable 'eshell-prompt-function
                        (function
                         (lambda ()
                           (concat "\n"
                                   (abbreviate-file-name (eshell/pwd))
	                           (if (= (user-uid) 0) " # " " $ ")))))

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
            ;; eshell-mode-map:    <key>
            ;; ehsell-command-map: C-c <key>
            (define-key eshell-command-map (kbd "SPC") nil) ;; unbind so that C-c SPC can be used for ace-jump-mode
            (define-key eshell-command-map (kbd "C-t") 'eshell-truncate-buffer-all)
            (define-key eshell-command-map (kbd "M-o") 'eshell-truncate-buffer-all)
            (define-key eshell-mode-map (kbd "<tab>") 'completion-at-point)
            (define-key eshell-mode-map (kbd "M-r") 'counsel-esh-history)
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

(defun eshell-bash-completion ()
  (setq-local bash-completion-nospace t)
  (while (pcomplete-here
          (nth 2 (bash-completion-dynamic-complete-nocomint (save-excursion (eshell-bol) (point)) (point))))))
(customize-set-variable 'eshell-default-completion-function 'eshell-bash-completion)

(provide 'my-eshell)

