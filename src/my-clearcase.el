;;;; my-clearcase.el - Customizations for using clearcase.el.

(require 'clearcase)
(require 'my-ediff)
(require 'my-local)

(add-hook 'clearcase-edcs-mode-hook
          (lambda ()
            (setq comment-start "#")))

(global-set-key (kbd "<f4>")    'clearcase-ediff-pred-current-buffer)
(global-set-key (kbd "<f5>")    'clearcase-ediff-branch-base-current-buffer)
(global-set-key (kbd "C-<f4>")  'clearcase-gui-diff-pred-current-buffer)
(global-set-key (kbd "C-<f5>")  'clearcase-gui-diff-branch-base-current-buffer)
(global-set-key (kbd "M-<f11>") 'clearcase-gui-vtree-browser-current-buffer) ; Help

(global-set-key (kbd "M-<f4>")  'start-clearcase-inspection-pred)
(global-set-key (kbd "M-<f5>")  'start-clearcase-inspection-base)

;; Currently, theis conflicts with avy-goto-char on C-;.  When I next
;; need to do this, find a good keybinding for this.
;(global-set-key (kbd "C-;")     'next-clearcase-inspection)

(global-set-key (kbd "M-<f1>")  'replace-clearcase-path-with-code-collaborator-inspection-line-region) ;; M-<f1>

(defvar current-clearcase-inspection-buffer nil)
(defvar current-clearcase-ediff-function nil)
(defvar clearcase-filename-regex "\\([^@[:space:]]+\\)@@\\([^@[:space:]]+\\)")
(defvar non-clearcase-filename-regex "\\([^@[:space:]]+\\).*$")

(defun start-clearcase-inspection-pred ()
  "Start a clearcase inspection against predecessors.

A clearcase inspection consists of a series of lines of file names:

filename
filename
filename
...

where filename is either a normal filename, such as
/a/b/c/foo.txt or a clearcase vpath such as
/a/b/c/foo.txt@@/main/some_branch.  The style of files may be
mixed.

You begin by placing point on the first line (it can be anywhere
on the line) and invoking
`start-clearcase-inspection-pred' (\\[start-clearcase-inspection-pred]).
This takes you to an Ediff window diffing the predecessor version
of the file in the left-hand window and the current version in
the right-hand window.  You are automatically navigated to the
first diff.  You may then use normal Ediff commands.  When you
are finished with the file, you may then invoke
`next-clearcase-inspection' (\\[next-clearcase-inspection]) and
the Ediff session will be ended and you will be taken to the
Ediff of the file on the next line in the buffer you invoked
`start-clearcase-inspection' in.

`next-clearcase-inspection' automatically checks when you run out
of files by checking that there is a file present and if it
exists."
  (interactive)
  (setq current-clearcase-ediff-function 'clearcase-ediff-pred-current-buffer)
  (start-clearcase-inspection-prim))

(defun start-clearcase-inspection-base ()
  "Start a clearcase inspection against bases.

See `start-clearcase-inspection-pred' for details."
  (interactive)
  (setq current-clearcase-ediff-function 'clearcase-ediff-branch-base-current-buffer)
  (start-clearcase-inspection-prim))

(defun next-clearcase-inspection ()
  "Go to the next file in a clearcase inspection."
  (interactive)
  (select-window (display-buffer "*Ediff Control Panel*"))
  (my-ediff-quit-no-prompt nil)
  (ediff-janitor nil nil)
  (select-window (display-buffer current-clearcase-inspection-buffer))
  (forward-line)
  (visit-file-and-ediff))

(defun start-clearcase-inspection-prim ()
  "Actually do the work to start a clearcase inspection and start the first ediff."
  (setq current-clearcase-inspection-buffer (current-buffer))
  (visit-file-and-ediff))

(defun replace-clearcase-path-with-code-collaborator-inspection-line-region ()
  "Call `replace-clearcase-path-with-code-collaborator-inspection-line' on every line in the region.

The workflow for this function should be as follows:

1. In a shell, execute cc_files_on_branch BRANCH:
   $ cc_files_on_branch BRANCH

   This will create a series of vpaths in the form

   /a/b/c@@BRANCH
   /d/e/f@@BRANCH
   ...

2. Copy the output to a buffer where you will remove directory
   vpaths and then organize the file vpaths.

3. Copy a selection of vpaths to a group.txt file such as
   group1.txt.  Immediately after yanking the vpaths, execute
   `replace-clearcase-path-with-code-collaborator-inspection-line-region' (\\[replace-clearcase-path-with-code-collaborator-inspection-line-region] or M-f1).
   This will transform each line into code collaborator
   inspection lines in the form

   /a/b/c BRANCH/LATEST BRANCH/0
   /e/e/f BRANCH/LATEST BRANCH/0"
  (interactive)
  (my-apply-function-to-region-lines 'replace-clearcase-path-with-code-collaborator-inspection-line))

(defun replace-clearcase-path-with-code-collaborator-inspection-line ()
  "If the current line contains a clearcase path, then replace it
with a code collaborator inspection line inspecting LATEST to 0."
  (interactive)
  (let ((filename (clearcase-filename-current-line))
        (branch (clearcase-branch-current-line)))
    (when (and filename branch)
      (beginning-of-line)
      (kill-line)
      (insert filename " " branch "/LATEST" " " branch "/0")
      (beginning-of-line))))

(defun visit-file-and-ediff ()
  "Visit the file at the beginning of the line and initiate an
ediff using the current value of
`current-clearcase-ediff-function' (which will be automatically
set via the functions `start-clearcase-inspection-pred' and
`start-clearcase-inspection-base'."
  (interactive)
  (let ((filename (clearcase-filename-current-line)))
    (unless filename
      (error "There is no filename on the line"))
    (unless (file-exists-p filename)
      (error "The string '%s' is not a file" filename))
    (let ((buffer (find-buffer-visiting filename)))
      (when buffer
        (kill-buffer buffer)))
    (find-file filename)
    (funcall current-clearcase-ediff-function)
    (select-window (display-buffer "*Ediff Control Panel*"))
    (ediff-next-difference)))

(defun clearcase-filename-current-line ()
  "Return the filename portion of a clearcase path in the current line, or nil."
  (interactive)
  (clearcase-filename (my-current-line)))

(defun clearcase-branch-current-line ()
  "Return the branch portion of a clearcase path in the current line, or nil."
  (interactive)
  (clearcase-branch (my-current-line)))

(defun clearcase-filename (string)
  "Return the filename portion of a clearcase or non-clearcase path STRING, or nil."
  (or (clearcase-filename-strict string)
      (non-clearcase-filename-strict string)))

(defun clearcase-branch (string)
  "Return the branch portion of STRING, or nil."
  (save-match-data
    (if (string-match clearcase-filename-regex string)
        (match-string 2 string)
      nil)))

(defun clearcase-filename-strict (string)
  "Return the filename portion of a clearcase path STRING, strictly, or nil."
  (save-match-data
    (if (string-match clearcase-filename-regex string)
        (match-string 1 string)
      nil)))

(defun non-clearcase-filename-strict (string)
  "Return the filename portion of a non-clearcase path STRING, strictly, or nil."
  (save-match-data
    (if (string-match non-clearcase-filename-regex string)
        (match-string 1 string)
      nil)))

(provide 'my-clearcase)

