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
        [_ n1 n2 char phrase] (re-find regex s)]
    [(str->int n1)
     (str->int n2)
     (first char)
     phrase]))

(defn count-valid-phrases [predicate]
  (count (filter (comp predicate parse-policy) input)))

(defn part-1 []
  (count-valid-phrases
    (fn [[n1 n2 char phrase]]
      (<= n1 (count (filter (partial = char) phrase)) n2))))

(defn part-2 []
  (count-valid-phrases
    (fn [[n1 n2 char phrase]]
      (xor (= char (get phrase (dec n1)))
           (= char (get phrase (dec n2)))))))

(part-1) ;; 572
(part-2) ;; 306
