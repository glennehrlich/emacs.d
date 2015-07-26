;;;; my-ido.el - Customizations for ido mode.

(require 'ido)

(with-no-warnings
  (defvar predicate nil)
  (defvar inherit-input-method nil)
  (defvar ido-default-item nil)
  (defvar ido-cur-list nil))

(require 'flx-ido)
(require 'ido-hacks)
(with-no-warnings (require 'ido-ubiquitous))
(require 'ido-vertical-mode)
(require 'smex)

(ido-mode 1)
(flx-ido-mode 1)
(ido-hacks-mode t)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)

;; These are set here instead of custom.el so that I can control all
;; of the interactions between all of the various ido extensions
;; better.

(setq ido-create-new-buffer 'always)
(setq ido-enable-flex-matching t)
(setq ido-everywhere nil)
(setq ido-ignore-directories '("\\`\\.git/" "\\`CVS/" "\\`\\.\\./" "\\`\\./"))
(setq ido-save-directory-list-file "~/.emacs.d.persistent/ido/ido.last")
(setq ido-use-faces t)
(setq ido-use-filename-at-point 'guess)
(setq ido-use-url-at-point t)
(setq ido-use-virtual-buffers nil) ; enables recentf if non-nil
(setq ido-work-directory-list-ignore-regexps '("~/r/backups/emacs"))

(global-set-key (kbd "M-x")         'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; normal M-x

(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(provide 'my-ido)

