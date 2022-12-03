(load-file "helpers.el")

(defvar example-input (slurp "../input/02-example"))
(defvar my-input (slurp "../input/02"))

(defvar input my-input)

(defun score-round (round)
  (pcase round
    ;; ties
    ('(rock rock) 3)
    ('(paper paper) 3)
    ('(scissors scissors) 3)
    ;; losses
    ('(rock scissors) 0)
    ('(scissors paper) 0)
    ('(paper rock) 0)
    ;; wins
    ('(scissors rock) 6)
    ('(paper scissors) 6)
    ('(rock paper) 6)))

(defun score-shape (shape)
  (pcase shape
    ('rock 1)
    ('paper 2)
    ('scissors 3)))

(defun parse-shape (string)
  (pcase string
    ((or "A" "X") 'rock)
    ((or "B" "Y") 'paper)
    ((or "C" "Z") 'scissors)))

(defun parse-round (string)
  (mapcar #'parse-shape (split-string string)))

(let ((rounds (mapcar #'parse-round (split-string input "\n"))))
  (seq-reduce
   (lambda (total-score round)
     (+ total-score
	(score-shape (cadr round))
	(score-round round)))
   rounds 0))
