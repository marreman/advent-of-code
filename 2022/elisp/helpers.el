(defun slurp (filename)
  "Return the contents of the file with name FILENAME as a string."
  (with-temp-buffer
    (insert-file-contents filename)
    (buffer-string)))
