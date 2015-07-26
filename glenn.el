;;;; glenn.el - A minimal emacs, all in one file, for remote environments or logins I don't control.
;;;;
;;;; To run:
;;;;
;;;; $ emacs -q -l glenn.el &

;; ------------------------------------------------------------
;; init.el
;; ------------------------------------------------------------

;; (setq debug-on-error t)
(setq debug-on-error nil)

(set-scroll-bar-mode 'right)

;; ------------------------------------------------------------
;; my-ediff.el
;; ------------------------------------------------------------

(require 'ediff)

;; This is not customizable; the help text for this variable says to
;; use setq-default.
(setq-default ediff-ignore-similar-regions t)

;; ------------------------------------------------------------
;; my-key-bindings.el
;; ------------------------------------------------------------

;; Physical key remappings.
(keyboard-translate ?\[ ?\() ; [ -> (
(keyboard-translate ?\] ?\)) ; ] -> )
(keyboard-translate ?\( ?\[) ; ( -> [
(keyboard-translate ?\) ?\]) ; ) -> ]

;; Function keys.
(global-set-key (kbd "<f1>")  'call-last-kbd-macro)
(global-set-key (kbd "<f2>")  'previous-error)
(global-set-key (kbd "<f3>")  'next-error)
(global-set-key (kbd "<f6>")  'undo)
(global-set-key (kbd "<f7>")  'repeat-complex-command)
(global-set-key (kbd "<f8>")  'lgrep)
(global-set-key (kbd "<f9>")  'my-narrow-to-region)
(global-set-key (kbd "<f10>") 'widen)
(global-set-key (kbd "<f11>") (lambda () "Scroll the window down one line." (interactive) (scroll-down 1)))
(global-set-key (kbd "<f12>") (lambda () "Scroll the window up one line."   (interactive) (scroll-up 1)))

;; Control function keys.
(global-set-key (kbd "C-<f8>") 'rgrep)

;; Editing keys.
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>")  'end-of-buffer)

;; Replace commands.
(global-set-key (kbd "M-&")   'replace-string)
(global-set-key (kbd "M-*")   'replace-regexp)
(global-set-key (kbd "M-?")   'query-replace)
(global-set-key (kbd "C-M-?") 'query-replace-regexp)

;; Command history.
(define-key minibuffer-local-map (kbd "<f7>") 'previous-history-element)
(define-key minibuffer-local-map (kbd "<f8>") 'next-history-element)

;; Other commands.
(global-set-key (kbd "M-g")     'goto-line)
(global-set-key (kbd "C-x m")   'compile)
(global-set-key (kbd "C-t")     'toggle-read-only)     ; was transpose-chars

;; Special keys.
(eval-when-compile (autoload 'recompile "compile" nil t))
(defun save-and-compile ()
  "Save the buffer and call `compile'."
  (interactive)
  (save-buffer)
  (compile compile-command))
(global-set-key (kbd "<print>") 'save-and-compile) ; Windows

;; ------------------------------------------------------------
;; my-local.el
;; ------------------------------------------------------------

(defun any-mode-untabify ()
  "Untabify automatically on file write.  Add this to a mode hook:

\(add-hook 'some-mode-hook  
           '(lambda () 
               (make-local-hook 'write-contents-hooks) 
                (add-hook 'write-contents-hooks 'any-mode-untabify nil t)))"
  (save-excursion
    (goto-char (point-min))
    (when (search-forward "\t" nil t)
      (untabify (1- (point)) (point-max)))
    nil))

(defun my-apply-keyboard-macro-to-region-lines-query-for-macro (top bottom macro)
  "Apply keyboard macro to all lines in the region.  Query for the macro name."
  (interactive "r\nafunction: ")
  (or macro
      (progn
	(if (null last-kbd-macro)
	    (error "No keyboard macro has been defined"))
	(setq macro last-kbd-macro)))
  (save-excursion
    (let ((end-marker (copy-marker bottom))
	  next-line-marker)
      (goto-char top)
      (if (not (bolp))
	  (forward-line 1))
      (setq next-line-marker (point-marker))
      (while (< next-line-marker end-marker)
	(goto-char next-line-marker)
	(save-excursion
	  (forward-line 1)
	  (set-marker next-line-marker (point)))
	(save-excursion
	  (let ((mark-active nil))
	    (execute-kbd-macro macro))))
      (set-marker end-marker nil)
      (set-marker next-line-marker nil))))

(defalias 'rb 'rename-buffer)

(defun shells ()
  "Create shells s0, s1, and s2."
  (interactive)
  (shell) (rename-buffer "s2")
  (shell) (rename-buffer "s1")
  (shell) (rename-buffer "s0"))

(defun home ()
  "\"Edit\" directory ~ using `dired'."
  (interactive)
  (dired "~"))

(defun my-current-line ()
  "Return the current line."
  (interactive)
  (buffer-substring (line-beginning-position) (line-end-position)))

(defun my-apply-function-to-region-lines (fn)
  "Apply function to all lines in the region.
For each line that begins in the region, move to the beginning of
the line, and run the function.

When called from lisp, this function takes two arguments TOP and
BOTTOM, describing the current region.  TOP must be before BOTTOM."
  (interactive "aFunction to apply to lines in region: ")
  (save-excursion
    (goto-char (region-end))
    (let ((end-marker (copy-marker (point-marker)))
          next-line-marker)
      (goto-char (region-beginning))
      (if (not (bolp))
          (forward-line 1))
      (setq next-line-marker (point-marker))
      (while (< next-line-marker end-marker)
        (let ((start nil)
              (end nil))
          (goto-char next-line-marker)
          (save-excursion
            (setq start (point))
            (forward-line 1)
            (set-marker next-line-marker (point))
            (setq end (point)))
          (save-excursion
            (let ((mark-active nil))
              (narrow-to-region start end)
              (funcall fn)
              (widen)))))
      (set-marker end-marker nil)
      (set-marker next-line-marker nil))))

(defun sort-and-delete-duplicate-lines ()
  "Sort and uniquify the lines in region."
  (interactive)
  (sort-lines nil
              (region-beginning)
              (region-end))
  (delete-duplicate-lines (region-beginning)
                          (region-end)))

(defun my-narrow-to-region ()
  "Like `narrow-to-region', except that it deactivates the mark."
  (interactive)
  (narrow-to-region (region-beginning) (region-end))
  (deactivate-mark)
  (goto-char (point-min)))

;; ------------------------------------------------------------
;; my-org.el
;; ------------------------------------------------------------

(require 'org)

(global-set-key (kbd "C-c l") 'org-store-link)

(define-key org-mode-map (kbd "C-c SPC") nil) ;; unbind so that C-c SPC can be used for ace-jump-mode
(define-key org-mode-map (kbd "<home>") 'beginning-of-buffer)
(define-key org-mode-map (kbd "<end>") 'end-of-buffer)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(org-clock-persistence-insinuate)

(add-hook 'text-mode-hook
          (lambda ()
            (setq tab-width 2)))

;; ------------------------------------------------------------
;; my-shell.el
;; ------------------------------------------------------------

(require 'shell)

;; Stuff to make shells understand when the shell window changes.
(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (set-process-window-size process (window-height) (window-width))))))

;; This needs to be done on a buffer local basis, so it's added to the shell-mode-hook.
(add-hook 'shell-mode-hook
          (lambda ()
            (add-hook 'window-configuration-change-hook 'comint-fix-window-size)))

(defun shell-truncate-buffer-all ()
  "Truncate the buffer."
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

(define-key comint-mode-map (kbd "C-c SPC") nil) ;; unbind so that C-c SPC can be used for ace-jump-mode
(define-key comint-mode-map (kbd "C-c C-t") 'shell-truncate-buffer-all)
(define-key comint-mode-map (kbd "C-c M-o") 'shell-truncate-buffer-all)

;; ------------------------------------------------------------
;; custom.el
;; ------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks 0)
 '(c-offsets-alist (quote ((arglist-intro . +))))
 '(column-number-mode t)
 '(comint-input-ignoredups t)
 '(compilation-scroll-output t)
 '(compilation-window-height 6)
 '(delete-old-versions t)
 '(delete-selection-mode t)
 '(dired-kept-versions 2)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-use-long-help-message nil)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(enable-local-variables :all)
 '(find-file-visit-truename t)
 '(font-lock-verbose nil)
 '(gc-cons-threshold 20000000)
 '(grep-files-aliases
   (quote
    (("all" . "* .*")
     ("el" . "*.el")
     ("cpp" . "*.h *.hpp *.c *.cc *.cpp *.ddl *.inl")
     ("perl" . "*.pl *.pm"))))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "for_reference_only" "oldunittest" "CMakeFiles")))
 '(haskell-hoogle-command "hoogle")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kept-new-versions 10)
 '(kept-old-versions 10)
 '(make-backup-files t)
 '(org-return-follows-link t)
 '(org-startup-folded t)
 '(org-startup-indented t)
 '(org-table-use-standard-references t)
 '(save-place nil nil (saveplace))
 '(save-place-file "/tmp/glenn.save.place")
 '(save-place-save-skipped nil)
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(split-height-threshold nil)
 '(split-width-threshold 160)
 '(tool-bar-mode nil)
 '(visual-line-mode nil t)
 '(woman-use-own-frame nil)
 )

;; ------------------------------------------------------------
;; init.el
;; ------------------------------------------------------------

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

