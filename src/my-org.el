;;;; my-org.el - Customizations for org mode.

(require 'org)

(global-set-key (kbd "C-c l") 'org-store-link)

(define-key org-mode-map (kbd "C-c SPC") nil) ;; unbind so that C-c SPC can be used for ace-jump-mode
(define-key org-mode-map (kbd "<home>") 'beginning-of-buffer)
(define-key org-mode-map (kbd "<end>") 'end-of-buffer)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(org-clock-persistence-insinuate)

(add-hook 'text-mode-hook
          (lambda ()
            (setq tab-width 2)))

(provide 'my-org)

