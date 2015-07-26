;;;; my-theme-looper.el - Customizations for theme looper.

(require 'theme-looper)

(theme-looper-set-theme-set '(
                              base16-grayscale-dark ; first in list

                              base16-3024-dark
                              base16-ashes-dark
                              base16-brewer-dark
                              base16-bright-dark
                              base16-chalk-dark
                              base16-colors-dark
                              base16-default-dark
                              base16-embers-dark
                              base16-google-dark
                              base16-greenscreen-dark
                              base16-isotope-dark
                              base16-pop-dark
                              base16-shapeshifter-dark
                              base16-tomorrow-dark
                              base16-twilight-dark
                              niflheim
                              noctilux
                              sanityinc-tomorrow-bright
                              sanityinc-tomorrow-eighties
                              sanityinc-tomorrow-night
                              wombat
                              zerodark
                              ))

(global-set-key (kbd "<M-f15>")   'theme-looper-enable-next-theme) ; Mac
(global-set-key (kbd "<M-pause>") 'theme-looper-enable-next-theme) ; boeing-linux

(provide 'my-theme-looper)

