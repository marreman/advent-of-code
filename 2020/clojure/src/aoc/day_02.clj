(ns aoc.day-02
  (:require [aoc.util :refer [lines str->int xor]]))

(def sample
  ["1-3 a: abcde"
   "1-3 b: cdefg"
   "2-9 c: ccccccccc"])

(def input
  (lines (slurp "../input/02")))

(defn parse-policy [s]
  (let [regex #"^(\d+)-(\d+) (\w): (\w+)$"
        [_ n1 n2 char password] (re-find regex s)]
    [(str->int n1)
     (str->int n2)
     (first char)
     password]))

(defn count-valid-passwords [predicate]
  (count (filter (comp predicate parse-policy) input)))

(defn part-1 []
  (count-valid-passwords
    (fn [[n1 n2 char password]]
      (<= n1 (count (filter (partial = char) password)) n2))))

(defn part-2 []
  (count-valid-passwords
    (fn [[n1 n2 char password]]
      (xor (= char (get password (dec n1)))
           (= char (get password (dec n2)))))))

(part-1) ;; 572
(part-2) ;; 306
