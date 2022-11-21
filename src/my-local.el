;;;; my-local.el - Stuff I write.

(require 'recentf)

(declare-function eshell-reset "esh-mode")

(defalias 'ac 'align-c-function-parameters)
(defalias 'ar 'align-regexp)
(defalias 'eb 'ediff-buffers)
(defalias 'rb 'rename-buffer)

(defun align-c-function-parameters ()
  "Align function call parameters in region."
  (interactive)
  (unless (region-active-p) (error "No region selected"))
  (align-regexp (region-beginning) (region-end) "[,(]\\(\\s-*\\)" 1 1 t)
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)\\()[ \t]*;\\)" 1 1 t))

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

(defun bc2 ()
  "Start up bc2 stuff."
  (interactive)
  (dired-with-name "~/git/bc2" "b")
  (dired-with-name "~/git/bc2/packetutil" "p")
  (dired-with-name "~/git/bc2/tcservice/src/bc2/tcengine" "t")
  (dired-with-name "~/g" "g")
  )

(defun bc2-vterms ()
  "Create starter vterms for int host."
  (interactive)
  (cd "~/bc2/usr/bin")
  (vterm "b4-send_tc")
  (vterm "b3-view_tm")
  (vterm "b2-tail_events")
  (vterm "b1-services")
  (vterm "b0-mss"))

(defun credit-cards ()
  "Visit ~/notes-personal/credit_cards.org."
  (interactive)
  (find-file "~/notes-personal/credit_cards.org"))

(defun dired-with-name (directory buffer-name)
  "\"Edit\" DIRECTORY using `dired' and rename it's buffer to BUFFER-NAME."
  (dired directory)
  (rename-buffer buffer-name))

(defun dot-files ()
  "\"Edit\" directory ~/dot-files using `dired'."
  (interactive)
  (dired "~/dot-files"))

(defun elpa ()
  "\"Edit\" directory ~/.emacs.d.elpa using `dired'."
  (interactive)
  (dired "~/.emacs.d.elpa"))

(defun emacs.d ()
  "\"Edit\" directory ~/.emacs.d using `dired'."
  (interactive)
  (dired "~/.emacs.d"))

(defun eshell-in-dir (dir buffer-name)
  "Open an eshell in DIR and name the buffer BUFFER-NAME."
  (interactive)
  (with-current-buffer (eshell-with-name buffer-name)
    (mkdir dir t)
    (cd dir)
    (eshell-reset))) ;; eshell-reset needed to get prompt to display correctly after creating buffer

(defun eshell-with-name (buffer-name)
  "Open an eshell in the current directory and name the buffer BUFFER-NAME."
  (interactive)
  (let ((eshell-buffer-name buffer-name))
    (switch-to-buffer (eshell t))))

(defun eshells ()
  "Create starter eshells."
  (interactive)
  (eshell-with-name "e2")
  (eshell-with-name "e1")
  (eshell-with-name "e0"))

(defun gitlab ()
  "\"Edit\" directory ~/gitlab using `dired'."
  (interactive)
  (dired "~/gitlab"))

(defun gitlab-archive ()
  "\"Edit\" directory ~/gitlab-archive using `dired'."
  (interactive)
  (dired "~/gitlab-archive"))

(defun home ()
  "\"Edit\" directory ~ using `dired'."
  (interactive)
  (dired "~"))

(defun meetings ()
  "\"Edit\" directory ~/r/org/meetings using `dired'."
  (interactive)
  (dired "~/r/org/meetings"))

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

(defun my-current-line ()
  "Return the current line."
  (interactive)
  (buffer-substring (line-beginning-position) (line-end-position)))

(defun my-narrow-to-region ()
  "Like `narrow-to-region', except that it deactivates the mark."
  (interactive)
  (narrow-to-region (region-beginning) (region-end))
  (deactivate-mark)
  (goto-char (point-min)))

(defun my-recentf-delete ()
  "Delete the recent list."
  (interactive)
  (setq recentf-list nil))

(defun notes ()
  "\"Edit\" directory ~/notes using `dired'."
  (interactive)
  (dired "~/notes"))

(defun notes-personal ()
  "\"Edit\" directory ~/notes-personal using `dired'."
  (interactive)
  (dired "~/notes-personal"))

(defun passwords ()
  "Visit ~/notes/passwords.org."
  (interactive)
  (find-file "~/notes/passwords.org"))

(defun phone-numbers ()
  "Visit ~/notes/phone_numbers.org."
  (interactive)
  (find-file "~/notes/phone_numbers.org"))

(defun ses ()
  "\"Edit\" directory /ssh:ses:/mnt/bclouddata/deployments/SES/dev using `dired'."
  (interactive)
  (dired "/ssh:ses:/mnt/bclouddata/deployments/SES/dev"))

(defun dev-1 ()
  "\"Edit\" directory /ssh:dev-1:/home1/um268c using `dired'."
  (interactive)
  (dired "/ssh:dev-1:/home1/um268c"))

(defun dev-2 ()
  "\"Edit\" directory /ssh:dev-2:/home1/um268c using `dired'."
  (interactive)
  (dired "/ssh:dev-2:/home1/um268c"))

(defun int-1 ()
  "\"Edit\" directory /ssh:int-1:/home1/um268c using `dired'."
  (interactive)
  (dired "/ssh:int-1:/home1/um268c"))

(defun int-2 ()
  "\"Edit\" directory /ssh:int-2:/home1/um268c using `dired'."
  (interactive)
  (dired "/ssh:int-2:/home1/um268c"))

(defun shell-in-dir (dir buffer-name)
  "Open a shell in DIR and name the buffer BUFFER-NAME."
  (interactive)
  (let ((the-current-directory default-directory)
        (the-current-buffer (current-buffer)))
    (mkdir dir t)
    (cd dir)
    (shell-with-name buffer-name)
    (switch-to-buffer the-current-buffer)
    (cd the-current-directory)))

(defun shell-with-name (buffer-name)
  "Open a shell in the current directory and name the buffer BUFFER-NAME."
  (interactive)
  (switch-to-buffer (shell))
  (rename-buffer buffer-name))

(defun shells ()
  "Create starter shells."
  (interactive)
  (shell-with-name "s2")
  (shell-with-name "s1")
  (shell-with-name "s0"))

(defun site-packages ()
  "\"Edit\" directory /opt/*conda/lib/python*/site-packages using `dired'."
  (interactive)
  (let ((matches (file-expand-wildcards "/opt/*conda/lib/python*/site-packages")))
    (when matches
      (dired (car matches)))))

(defun sort-and-delete-duplicate-lines ()
  "Sort and uniquify the lines in region."
  (interactive)
  (sort-lines nil
              (region-beginning)
              (region-end))
  (delete-duplicate-lines (region-beginning)
                          (region-end)))

(defun sps ()
  "\"Edit\" directory /ssh:sps:/mnt/bclouddata/deployments/SPS/dev using `dired'."
  (interactive)
  (dired "/ssh:sps:/mnt/bclouddata/deployments/SPS/dev"))

(defun start ()
  "Create the shells and visit ~/todo/todo.org."
  (interactive)
  (cd "~")
  (vterms)
  (todo))

(defun todo ()
  "Visit ~/todo/todo.org."
  (interactive)
  (find-file "~/todo/todo.org"))

(defun vterm-in-dir (dir buffer-name)
  "Open a vterm in DIR and name the buffer BUFFER-NAME."
  (interactive)
  (let ((the-current-directory default-directory)
        (the-current-buffer (current-buffer)))
    (mkdir dir t)
    (cd dir)
    (vterm buffer-name)
    (switch-to-buffer the-current-buffer)
    (cd the-current-directory)))

(defun vterms ()
  "Create starter vterms."
  (interactive)
  (vterm "v2")
  (vterm "v1")
  (vterm "v0"))

(defun int-vterms ()
  "Create starter vterms for int host."
  (interactive)
  (vterm "i3")
  (vterm "i2")
  (vterm "i1")
  (vterm "i0"))

(provide 'my-local)

