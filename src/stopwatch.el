;; -*- lexical-binding: t -*-
;;;; stopwatch.el - Minimal stopwatch functionality.

(defvar *stopwatch-start-time* nil "The time when the stopwatch is started.")
(defvar *stopwatch-lap-time* nil "The time when the last lap started.")

(defun stopwatch-start ()
  "Start the stopwatch and the current lap.  Returns 0."
  (setq *stopwatch-start-time* (current-time))
  (setq *stopwatch-lap-time* *stopwatch-start-time*)
  0)

(defun stopwatch-lap ()
  "Start a new lap; returns the number of seconds of the last lap."
  (let* ((lap (current-time))
         (lap-time (float-time (time-subtract lap *stopwatch-lap-time*))))
    (setq *stopwatch-lap-time* lap)
    lap-time))

(defun stopwatch-stop ()
  "Stops the stopwatch; returns the total number of seconds."
  (stopwatch-lap)
  (float-time (time-subtract *stopwatch-lap-time* *stopwatch-start-time*)))

(defun stopwatch-lap-message (msg)
  "Start a new lap and output a message with the last lap time;
returns the number of seconds of the last lap."
  (let ((lap-time (stopwatch-lap)))
    (message "%s: %f" msg lap-time)
    lap-time))

(defun stopwatch-stop-message (msg)
  "Stop the stopwatch and output a message with the total number of seconds;
returns the total number of seconds."
  (let ((total-time (stopwatch-stop)))
    (message "%s: %f" msg total-time)
    total-time))

(provide 'stopwatch)

