;;;; my-undo-tree.el - Customizations for undo-tree mode.

(require 'diminish)
(require 'undo-tree)

(diminish 'undo-tree-mode)

(global-undo-tree-mode)

(provide 'my-undo-tree)

