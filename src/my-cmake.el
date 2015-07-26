;;;; my-cmake.el - Customizations for cmake mode.

(require 'cmake-mode)
(require 'andersl-cmake-font-lock)

(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)

(add-hook 'cmake-mode-hook
          (lambda ()
            (modify-syntax-entry ?_  "_" cmake-mode-syntax-table)))
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)

(provide 'my-cmake)

