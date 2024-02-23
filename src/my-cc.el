;; -*- lexical-binding: t -*-
;;;; my-cc.el - Customizations for cc mode.

(require 'cc-mode)
(require 'ggtags) ;; further customization of ggtags is in my-ggtags
(require 'ivy)
(require 'magit-git)
(require 's)
(require 'wrap-region)

(defvar compile-cmake-history ()
  "History list for compile-cmake.")

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(customize-set-variable 'c-offsets-alist '((arglist-intro . +)))

;; https://confluence-sdteob.web.boeing.com/pages/viewpage.action?pageId=95208047
(setq c-default-style "bsd" ; allman style
      c-basic-offset 3)     ; indent by 3 spaces

;; This seems to really mess up in c based modes like java. Alginment
;; of assignment statements and portions extend too far back, messing
;; up the aesthetics of lines. Additionally, spacing in lines in
;; mulit-line comments gets messed up as well.
;;(define-key c-mode-base-map (kbd "RET") 'align-newline-and-indent)

(define-key c-mode-base-map (kbd "C-<return>") 'align-current)
(define-key c-mode-base-map (kbd "M-<return>") 'c-indent-defun)

(define-key c-mode-base-map (kbd "TAB") 'c-indent-line-or-region) ;; until auto complete figured out
(define-key c-mode-base-map (kbd "S-<tab>") 'c-indent-line-or-region)
(define-key c-mode-base-map (kbd "<backtab>") 'c-indent-line-or-region)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-toggle-hungry-state 1)
            (wrap-region-mode 1)
            ))

(defun compile-cmake (&optional target use-original-compile)
  "Compile TARGET in the current git repository's `build' directory
with `make'. If TARGET is a test, run it with `ctest'. If TARGET
is not provided, compile everything and run all tests.

With prefix arg, runs `compile'."
  (interactive
   (if current-prefix-arg
       (list nil t)
     (list
      (ivy-read "Target: "
            (make-targets)
            :preselect (ivy-thing-at-point)
            :history 'compile-cmake-history
            :caller 'compile-cmake)
      nil)))
  (if use-original-compile
      (call-interactively 'compile)
    (let ((build-dir (concat (magit-toplevel) "build"))
          (command nil))
      (unless (file-directory-p build-dir)
        (error "No such directory: %s" build-dir))
      (if (string-empty-p target)
          ; (setq command (format "cd %s/ ; make -j `nproc` && ctest --verbose" build-dir))
          (setq command (format "cd %s/ ; make -j1 && ctest --verbose" build-dir))
        ; (setq command (format "cd %s/ ; make -j `nproc` %s && ctest --verbose -R %s" build-dir target target)))
        (setq command (format "cd %s/ ; make -j1 %s && ctest --verbose -R \"%s$\"" build-dir target target)))
      (compile command))))

(defun cmake (&optional clear-build-directory)
  "Run cmake in the current git repository's `build' directory.

With prefix arg CLEAR-BUILD-DIRECTORY, deletes the contents of
the `build' directory before running cmake."
  (interactive "P")
  (message "clear-build-directory: %s" clear-build-directory)
  (let* ((build-dir (cmake-build-directory))
         (build-dir-exists (file-directory-p build-dir)))
    (unless build-dir-exists
      (make-directory build-dir))
    (if clear-build-directory
        (compile (format "cd %s && rm -rf * && cmake .." build-dir))
      (compile (format "cd %s && cmake .." build-dir)))))

(defun cmake-toplevel ()
  (let* ((toplevel (magit-toplevel))
         (toplevel-exists toplevel)
         (cmakelists-txt-file (expand-file-name "CMakeLists.txt" toplevel))
         (cmakelists-txt-file-exists (file-readable-p cmakelists-txt-file)))
    (unless toplevel-exists
      (error "Not in a git repository"))
    (unless cmakelists-txt-file-exists
      (error "No CMakeLists.txt in %s" toplevel))
    toplevel))

(defun cmake-build-directory ()
  (expand-file-name "build" (cmake-toplevel)))

(defun cmake-build-directory-p ()
  (file-directory-p (cmake-build-directory)))

(defun make-targets ()
  "Return the make targets in the current git repository's `build' directory."
  (interactive)
  (let* ((build-dir (cmake-build-directory))
         (command (format "cd %s/ ; make help" build-dir))                                     ; the command
         (make-help-output (shell-command-to-string command))                                  ; run the command
         (lines (string-lines make-help-output t))                                             ; separate output into list of lines
         (targets (-map (lambda (line) (nth 1 (s-match "\\.\\.\\. \\([^ ]+\\)" line))) lines)) ; get the targets
         (unique-targets (-remove #'null (-distinct targets)))                                 ; get unique targets and remove any nils
         (sorted-unique-targets (-sort #'string< unique-targets)))                             ; sort the targets
    sorted-unique-targets))

(provide 'my-cc)

