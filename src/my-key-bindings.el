;;;; my-key-bindings.el - Global key bindings.

;; Physical key remappings.
(define-key key-translation-map (kbd "[") (kbd "(")) ; [ -> (
(define-key key-translation-map (kbd "]") (kbd ")")) ; ] -> )
(define-key key-translation-map (kbd "(") (kbd "[")) ; ( -> [
(define-key key-translation-map (kbd ")") (kbd "]")) ; ) -> ]

;; Function keys.
(global-set-key (kbd "<f1>")  'call-last-kbd-macro)
(global-set-key (kbd "<f2>")  'previous-error)
(global-set-key (kbd "<f3>")  'next-error)
(global-set-key (kbd "<f6>")  'undo)
(global-set-key (kbd "<f7>")  'repeat-complex-command)
;; f8 is bound to counsel-rg in my-ivy.el .
(global-set-key (kbd "<f9>")  'my-narrow-to-region)
(global-set-key (kbd "<f10>") 'widen)
(global-set-key (kbd "<f11>") (lambda () "Scroll the window down one line." (interactive) (scroll-down 1)))
(global-set-key (kbd "<f12>") (lambda () "Scroll the window up one line."   (interactive) (scroll-up 1)))

(global-set-key (kbd "<f14>") 'calc)
(global-set-key (kbd "<f15>") 'calendar)

;; Control function keys.
(global-set-key (kbd "C-<f6>") 'winner-undo)
(global-set-key (kbd "C-<f7>") 'winner-redo)
; (global-set-key (kbd "C-<f8>") 'rgrep) ; glenn: temporarily trying counsel-ag for this

;; Meta function keys.
(global-set-key (kbd "M-<f6>") (lambda () "Call `revert-buffer' without confirmation." (interactive) (revert-buffer t t)))
(global-set-key (kbd "M-<f8>") 'quick-calc)

;; Editing keys.
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>")  'end-of-buffer)
(global-set-key (kbd "C-M-SPC")  (lambda () "Call `cycle-spacing' with -1 so that it deletes newlines." (interactive) (cycle-spacing -1)))

;; Replace commands.
(global-set-key (kbd "M-&")   'replace-string)
(global-set-key (kbd "M-*")   'vr/replace) ; was replace-regexp
(global-set-key (kbd "M-?")   'query-replace)
(global-set-key (kbd "C-M-?") 'vr/query-replace) ; was query-replace-regexp

;; Avy commands.
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g") 'avy-goto-line)
(global-set-key (kbd "M-o") 'ace-window) ;; really an avy package

;; Command history.
(define-key minibuffer-local-map (kbd "<f7>") 'previous-history-element)
(define-key minibuffer-local-map (kbd "<f8>") 'next-history-element)

;; Other commands.
;; (global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "C-x m")   'compile)
;; (global-set-key (kbd "C-t")     'shell-pop)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window) ; was list-buffers
(global-set-key (kbd "C-=")     'er/expand-region)
(global-set-key (kbd "C-\\")    'er/contract-region)

;; Hungry delete commands.
(global-set-key (kbd "C-c <backspace>")  'hungry-delete-backward)
(global-set-key (kbd "C-c <deletechar>") 'hungry-delete-forward)

;; Special keys.
(eval-when-compile (autoload 'recompile "compile" nil t))
(defun save-and-compile ()
  "Save the buffer and call `compile'."
  (interactive)
  (save-buffer)
  (compile compile-command))
(global-set-key (kbd "<f13>")   'save-and-compile) ; Mac (Ins key)

(global-set-key (kbd "<kp-delete>") 'magit-status) ; mac / linux (DEL key)
(global-set-key (kbd "<delete>")    'magit-status) ; Linux (Del key)
(global-set-key (kbd "C-x g")       'magit-status) ; recommendend key binding

(global-set-key (kbd "M-<delete>") 'magit-log-buffer-file) ; mac / linux (M-DEL key)

(global-set-key (kbd "C-C M-g l") 'magit-log-buffer-file)
(global-set-key (kbd "C-C M-g L") 'magit-log-buffer-file-popup)

(global-set-key (kbd "C-M-<delete>")    'magit-list-repositories)
(global-set-key (kbd "C-M-<backspace>") 'magit-list-repositories)

;; Stop overwrite mode
(global-set-key (kbd "<insert>") nil)
(global-set-key (kbd "<insertchar>") nil)

(global-set-key (kbd "M-k") 'docker)

(provide 'my-key-bindings)

