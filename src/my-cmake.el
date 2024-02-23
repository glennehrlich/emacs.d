;; -*- lexical-binding: t -*-
;;;; my-cmake.el - Customizations for cmake mode.

(require 'cmake-mode)
(require 'cmake-font-lock)

(add-hook 'cmake-mode-hook
          (lambda ()
            (modify-syntax-entry ?_  "_" cmake-mode-syntax-table)))
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

(provide 'my-cmake)

