;;;; my-org.el - Customizations for org mode.

(require 'org)

(customize-set-variable 'org-clock-into-drawer nil)
(customize-set-variable 'org-clock-persist t)
(customize-set-variable 'org-clock-persist-file "~/.emacs.d.persistent/org/org-clock-save.el")
(customize-set-variable 'org-file-apps '((auto-mode . emacs)
                                         ("\\.mm\\'" . default)
                                         ("\\.x?html?\\'" . default)
                                         ("\\.pdf\\'" . default)
                                         (directory . emacs)))
(customize-set-variable 'org-return-follows-link t)
(customize-set-variable 'org-startup-folded t)
(customize-set-variable 'org-startup-indented t)
(customize-set-variable 'org-table-use-standard-references t)
(customize-set-variable 'org-todo-keywords '((sequence "TODO" "WORKING" "|" "DONE" "CANCELLED")))

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

