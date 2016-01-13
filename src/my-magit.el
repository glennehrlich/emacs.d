;;;; my-magit.el - Customizations for magit mode.

(require 'magit)

;; Format log margin with a date instead of a duration.
(defun magit-format-duration--format-date (duration spec width)
  (format-time-string "%Y-%m-%d %H:%M "
                      (seconds-to-time (- (float-time) duration))))
(advice-add 'magit-format-duration :override
            'magit-format-duration--format-date)
(setq magit-log-margin-spec '(40 13 magit-duration-spec))

(provide 'my-magit)

