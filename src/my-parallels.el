;; -*- lexical-binding: t -*-
;;;; my-parallels.el - Customizations for when running in parallels.

;; Clones of common meta control keystrokes because parallels can't
;; recognize them.  These are only needed when running windows.
(global-set-key (kbd "C-s-SPC") 'mark-sexp)               ; C-M-SPC
(global-set-key (kbd "C-s-b")   'backward-sexp)           ; C-M-b
(global-set-key (kbd "C-s-f")   'forward-sexp)            ; C-M-f
(global-set-key (kbd "C-s-r")   'isearch-backward-regexp) ; C-M-r
(global-set-key (kbd "C-s-s")   'isearch-forward-regexp)  ; C-M-s
(global-set-key (kbd "C-s-\\")  'indent-region)           ; C-M-\

;; (global-set-key (kbd "C-s-q")   'fill-paragraph)          ; C-M-q, also Option-Q

;; Temp settings for vmware until I make a separate file for them.
(global-set-key (kbd "∫") 'backward-sexp)           ; C-M-b
(global-set-key (kbd "ƒ") 'forward-sexp)            ; C-M-f
(global-set-key (kbd "®") 'isearch-backward-regexp) ; C-M-r
(global-set-key (kbd "ß") 'isearch-forward-regexp)  ; C-M-s
(global-set-key (kbd "«") 'indent-region)           ; C-M-\

(provide 'my-parallels)

