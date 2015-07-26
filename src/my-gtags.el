;;;; my-gtags.el - Customizations for global's gtags.el

(require 'gtags)

(gtags-mode 1)

(setq gtags-disable-pushy-mouse-mapping t)

(define-key gtags-select-mode-map (kbd "C-f") 'forward-char)
(define-key gtags-select-mode-map (kbd "C-b") 'backward-char)
(define-key gtags-select-mode-map (kbd "C-t") 'toggle-read-only)

(defun gtags-next-tag ()
  "Find next matching tag, for GTAGS."
  (interactive)
  (let ((latest-gtags-buffer
         (car (delq nil (mapcar (lambda (x) (and (string-match "GTAGS SELECT" (buffer-name x)) (buffer-name x)))
                                (buffer-list))))))
    (cond (latest-gtags-buffer
           (switch-to-buffer latest-gtags-buffer)
           (forward-line)
           (gtags-select-it nil)))))

(defun gtags-previous-tag ()
  "Find previous matching tag, for GTAGS."
  (interactive)
  (let ((latest-gtags-buffer
         (car (delq nil (mapcar (lambda (x) (and (string-match "GTAGS SELECT" (buffer-name x)) (buffer-name x)))
                                (buffer-list))))))
    (cond (latest-gtags-buffer
           (switch-to-buffer latest-gtags-buffer)
           (forward-line -1)
           (gtags-select-it nil)))))

(provide 'my-gtags)

(global-set-key (kbd "M-.")  'gtags-find-tag)
(global-set-key (kbd "C-.") 'gtags-find-rtag)
(global-set-key (kbd "C-s-.") 'gtags-find-symbol) ; C-M-. (parallels)
(global-set-key (kbd "M-,") 'gtags-pop-stack)
(global-set-key (kbd "M-<f2>") 'gtags-previous-tag)
(global-set-key (kbd "M-<f3>") 'gtags-next-tag)
