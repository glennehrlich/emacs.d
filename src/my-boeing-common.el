;;;; my-boeing-common.el - Customizations for running emacs at boeing that are common to all environments.

(require 'ffap)
(require 'my-clearcase)
; (require 'my-vc-clearcase)
(require 'my-gtags)
; (require 'my-ggtags)
(require 'my-local)
(require 'my-parallels)

;; Start the frame maximized.
(toggle-frame-maximized)

;; Tell emacs that the physical timezone is mountain.  org-mode times
;; will display in local time instead of utc.
(set-time-zone-rule "MST")

(add-to-list 'auto-mode-alist '("\\.ddl\\'" . c++-mode))

(add-to-list 'ffap-c++-path "/v/iridium")
(add-to-list 'ffap-c++-path "/v/iridium/boost")
(add-to-list 'ffap-c++-path "/tools/gcc-4.8.1/include/c++/4.8.1")

;; Override any key bindings.
(global-set-key (kbd "M-*") 'vr/replace) ; was replace-regexp
(define-key gtags-mode-map (kbd "M-*") 'vr/replace)

(defun branches ()
  "\"Edit\" directory ~/r/branhces using `dired'."
  (interactive)
  (dired "~/r/branches"))

(defun constpop ()
  "Visit /v/inf/inf/namesvc/source/constPopulation.xml."
  (interactive)
  (find-file "/v/inf/inf/namesvc/source/constPopulation.xml"))

(defun constpopi ()
  "Visit ~/i/cfg/inf/constPopulation.xml."
  (interactive)
  (find-file "~/i/cfg/inf/constPopulation.xml"))

(defun cots ()
  "\"Edit\" directory /v/scs_cots using `dired'."
  (interactive)
  (dired "/v/scs_cots"))

(defun inf ()
  "\"Edit\" directory /v/inf/inf using `dired'."
  (interactive)
  (dired "/v/inf/inf"))

(defun inm ()
  "\"Edit\" directory /v/inm/inm using `dired'."
  (interactive)
  (dired "/v/inm/inm"))

(defun inm/pmts ()
  "\"Edit\" directory /v/inm/inm/pmts using `dired'."
  (interactive)
  (dired "/v/inm/inm/pmts"))

(defun inm/tpc ()
  "\"Edit\" directory /v/inm/inm/tpc using `dired'."
  (interactive)
  (dired "/v/inm/inm/tpc"))

(defun inspections ()
  "\"Edit\" directory ~/inspections using `dired'."
  (interactive)
  (dired "~/inspections"))

(defun iridium ()
  "\"Edit\" directory /v/iridium using `dired'."
  (interactive)
  (dired "/v/iridium"))

(defun master (pattern)
  "\"Edit\" directory /home/scsbuild/MASTER/*pattern* using `dired'."
  (interactive "s/home/scsbuild/MASTER: ")
  (let ((directory (concat "/home/scsbuild/MASTER/" "*" pattern "*")))
    (dired directory)))

(defun mps ()
  "\"Edit\" directory /v/mps/mps using `dired'."
  (interactive)
  (dired "/v/mps/mps"))

(defun mps/tpc ()
  "\"Edit\" directory /v/mps/mps/tpc using `dired'."
  (interactive)
  (dired "/v/mps/mps/tpc"))

(defun nsc ()
  "\"Edit\" directory /v/sgc/nsc using `dired'."
  (interactive)
  (dired "/v/sgc/nsc"))

(defun orb ()
  "\"Edit\" directory /v/orb/orb using `dired'."
  (interactive)
  (dired "/v/orb/orb"))

(defun my-projects ()
  "\"Edit\" directory /projects/mp_build/ehrlic_g using `dired'."
  (interactive)
  (dired "/projects/mp_build/ehrlic_g"))

(defun projects ()
  "\"Edit\" directory /projects/mp_build using `dired'."
  (interactive)
  (dired "/projects/mp_build"))

(defun raci ()
  "\"Edit\" directory /v/mps/raci using `dired'."
  (interactive)
  (dired "/v/mps/raci"))

(defun sdf ()
  "Setup sdf."
  (interactive)
  (dired "/v/sgc/sdfview")
  (dired "/v/sgc/sdfview/sdf_importer/xml")
  (dired "/v/sgc/sdfview/sdf_importer/util")
  (dired "/v/sgc/sdfview/sdf_importer/unittest") (rename-buffer "u")
  (dired "/v/sgc/sdfview/sdf_importer/mongo")
  (dired "/v/sgc/sdfview/sdf_importer/insert")
  (dired "/v/sgc/sdfview/sdf_importer/from")
  (dired "/v/sgc/sdfview/sdf_importer/apps")
  (dired "/v/sgc/sdfview/sdf_importer/") (rename-buffer "sdf")
  (dired "/v/sgc/sdfview/web")
  (find-file "/v/sgc/sdfview/sdf_importer/unittest/test_sdf_importer.cc") (rename-buffer "t1"))

(defun sgc ()
  "\"Edit\" directory /v/sgc/sgc using `dired'."
  (interactive)
  (dired "/v/sgc/sgc"))

(provide 'my-boeing-common)
