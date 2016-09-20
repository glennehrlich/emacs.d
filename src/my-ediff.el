;;;; my-ediff.el - Customizations for ediff mode.

(require 'ediff)

;; This is not customizable; the help text for this variable says to
;; use setq-default.
(setq-default ediff-ignore-similar-regions t)

(customize-set-variable 'ediff-split-window-function 'split-window-horizontally)
(customize-set-variable 'ediff-use-long-help-message nil)
(customize-set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)

(defun my-ediff-quit-no-prompt (reverse-default-keep-variants)
  "Finish an Ediff session and exit Ediff with no prompting."
  (interactive "P")
  (ediff-barf-if-not-control-buffer)
  (let ((ctl-buf (current-buffer))
	(ctl-frm (selected-frame))
	(minibuffer-auto-raise t))
    (progn
	  (message "")
	  (set-buffer ctl-buf)
	  (ediff-really-quit reverse-default-keep-variants))))

(provide 'my-ediff)

