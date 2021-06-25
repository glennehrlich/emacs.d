;;;; my-shell.el - Customizations for shell mode.

(require 'counsel)
(require 'shell)
(require 'dirtrack)

(customize-set-variable 'explicit-shell-file-name "/usr/bin/bash")

;; Make shells open in same window.
(add-to-list 'display-buffer-alist '("*shell*" display-buffer-same-window))

;; (setq-default dirtrack-list '("^.*:\\(.*\\)" 1 t))
;; (add-hook 'shell-mode-hook
;;          (lambda ()
;;            (shell-dirtrack-mode -1)
;;            (dirtrack-mode 1)))

;; Stuff to make shells understand when the shell window changes.
(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (set-process-window-size process (window-height) (window-width))))))

;; This needs to be done on a buffer local basis, so it's added to the shell-mode-hook.
(add-hook 'shell-mode-hook
          (lambda ()
            (add-hook 'window-configuration-change-hook 'comint-fix-window-size)))

;; Better color handling.

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(defun shell-truncate-buffer-all ()
  "Truncate the buffer."
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(define-key comint-mode-map (kbd "C-c SPC") nil) ; unbind so that C-c SPC can be used for ace-jump-mode
(define-key comint-mode-map (kbd "C-c C-t") 'shell-truncate-buffer-all)
(define-key comint-mode-map (kbd "C-c M-o") 'shell-truncate-buffer-all)
(define-key comint-mode-map (kbd "C-l")     'shell-truncate-buffer-all)

(define-key comint-mode-map (kbd "M-r") 'counsel-shell-history) ; override comint-history-isearch-backward-regexp

(provide 'my-shell)

