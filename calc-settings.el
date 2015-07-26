;;;; calc-settings.el - calc settings file.

(defmath bits ((natnum n))
  "Compute the number of bits required to represent the non-negative integer at the top of the stack."
  (interactive 1 "bits")
  (ceil (log n 2)))

(put 'calc-define 'calc-bits '(progn
 (define-key calc-mode-map "zb" 'calc-bits)
))


;;; Mode settings stored by Calc on Wed May 28 15:20:29 2014
(setq calc-line-numbering nil)
;;; End of mode settings

