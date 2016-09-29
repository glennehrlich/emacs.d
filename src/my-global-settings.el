;;;; my-global-settings.el - Global settings.

(customize-set-variable 'blink-cursor-blinks 0)
(customize-set-variable 'enable-local-variables :all)
(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'inhibit-startup-screen t)
(customize-set-variable 'initial-scratch-message nil)
(customize-set-variable 'split-height-threshold nil)

(column-number-mode)
(delete-selection-mode 1)
(tool-bar-mode -1)

;; For some reason, save-place-mode is weird and this does not
;; work. I'm keeping '(save-place-mode nil) in custom.el for now.
;; (save-place-mode nil)

(provide 'my-global-settings)

