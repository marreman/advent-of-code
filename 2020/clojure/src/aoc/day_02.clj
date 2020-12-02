(ns aoc.day-02
  (:require [aoc.util :as util]))

(def sample
  ["1-3 a: abcde"
   "1-3 b: cdefg"
   "2-9 c: ccccccccc"])

(def input
  (util/lines (slurp "../input/02")))

(defn- parse-policy [s]
  (let [regex #"^(\d+)-(\d+) (\w): (\w+)$"
        [_ n1 n2 char phrase] (re-find regex s)]
    [(util/str->int n1)
     (util/str->int n2)
     (first char)
     phrase]))

(defn valid-password? [[n1 n2 char phrase]]
  (let [char-count (count (filter (partial = char) phrase))]
    (<= n1 char-count n2)))

(defn part-1 []
  (count (filter (comp valid-password? parse-policy) input)))

(defn valid-password-2? [[n1 n2 char phrase]]
  (util/xor (= char (get phrase (dec n1)))
            (= char (get phrase (dec n2)))))

(defn part-2 []
  (count (filter (comp valid-password-2? parse-policy) input)))

(part-1) ;; 572
(part-2) ;; 306
