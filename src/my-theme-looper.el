;;;; my-theme-looper.el - Customizations for theme looper.

(require 'theme-looper)

(theme-looper-set-theme-set '(
                              base16-grayscale-dark ; first in list to cleanse palette

                              base16-chalk
                              idea-darkula
                              niflheim
                              noctilux
                              zerodark
                              ))

(global-set-key (kbd "<M-f12>")   'theme-looper-enable-next-theme) ; Mac
(global-set-key (kbd "<M-pause>") 'theme-looper-enable-next-theme) ; boeing-linux

(provide 'my-theme-looper)

