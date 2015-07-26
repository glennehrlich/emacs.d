;;;; my-vc-clearcase.el - Customizations for using vc-clearcase.el.

;; No require available for this.
(load "vc-clearcase-auto")

;; (global-set-key (kbd "<f4>")        'clearcase-ediff-pred-current-buffer)
;; (global-set-key (kbd "<f5>")        'clearcase-ediff-branch-base-current-buffer)
;; (global-set-key (kbd "C-<f4>")      'clearcase-gui-diff-pred-current-buffer)
;; (global-set-key (kbd "C-<f5>")      'clearcase-gui-diff-branch-base-current-buffer)
(global-set-key (kbd "C-M-S-<f11>") 'vc-clearcase-gui-vtree-browser) ; Help

(provide 'my-vc-clearcase)

