(eval-when-compile
  (defvar fancy-narrow--beginning nil)
  (defvar fancy-narrow--end nil)
  (autoload 'fancy-narrow--motion-function "fancy-narrow" nil t))
(use-package fancy-narrow
  :disabled t
  :commands (fancy-narrow-to-region fancy-widen))

