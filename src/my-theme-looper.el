;;;; my-theme-looper.el - Customizations for theme looper.

(require 'theme-looper)

(theme-looper-set-favorite-themes '(
                                    zerodark
                                    ))

(global-set-key (kbd "<M-f11>")   'theme-looper-enable-previous-theme)
(global-set-key (kbd "<M-f12>")   'theme-looper-enable-next-theme)

(provide 'my-theme-looper)
