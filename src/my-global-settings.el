;;;; my-global-settings.el - Global settings.

(column-number-mode)
(delete-selection-mode 1)
(tool-bar-mode -1)
(customize-set-variable 'ring-bell-function 'ignore)

;; For some reason, save-place-mode is weird and this does not
;; work. I'm keeping '(save-place-mode nil) in custom.el for now.
;; (save-place-mode nil)

(provide 'my-global-settings)

