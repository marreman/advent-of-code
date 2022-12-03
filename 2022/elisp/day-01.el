(load-file "helpers.el")

(defvar example-input (slurp "../input/01-example"))
(defvar my-input (slurp "../input/01"))

(defun solve (input)
  "Solve part 1 using INPUT."
  (let ((groups (split-string input "\n\n"))
        (result 0))
    (dolist (group groups result)
      (let ((sum (apply '+ (mapcar 'string-to-number (split-string group)))))
        (setq result (max sum result))))
    ))


(defun solve-alt (input)
  "Alternative take where INPUT is reduced."
  (car
   (seq-reduce
    (lambda
      (state next)
      (let* ((biggest (car state))
             (current (cadr state)))
        (if (empty? next)
            (list (max biggest current) 0)
          (list biggest (+ current (string-to-number next))))))
    (split-string input "\n")
    '(0 0))))

(defun empty? (string)
  "Check if STRING is empty."
  (eq (length string) 0))

(solve-alt my-input)
(solve my-input)
