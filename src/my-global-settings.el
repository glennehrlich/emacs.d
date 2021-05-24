;;;; my-global-settings.el - Global settings.

(blink-cursor-mode 1)
(column-number-mode)
(customize-set-variable 'ring-bell-function 'ignore)
(delete-selection-mode 1)
(global-auto-revert-mode t)
(tool-bar-mode -1)

;; For some reason, save-place-mode is weird and this does not
;; work. I'm keeping '(save-place-mode nil) in custom.el for now.
;; (save-place-mode nil)

(provide 'my-global-settings)

