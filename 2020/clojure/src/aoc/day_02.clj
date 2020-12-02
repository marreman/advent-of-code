(ns aoc.day-02
  (:require [aoc.util :as util]))

(def sample
  ["1-3 a: abcde"
   "1-3 b: cdefg"
   "2-9 c: ccccccccc"])

(def input
  (util/lines (slurp "../input/02")))

(defn valid-password? [s]
  (let [[_ min max char password] (re-find #"^(\d+)-(\d+) (\w): (\w+)$" s)
        found-chars (filter #(= char (str %)) password)]
    (<= (util/str->int min) (count found-chars) (util/str->int max))))

(defn part-1 []
  (count (filter valid-password? input)))

(defn xor [x y]
  (and (or x y)
       (not= x y)))

(defn valid-password-2? [s]
  (let [matcher (re-matcher #"\d+|\w+" s)
        pos-1 (dec (util/str->int (re-find matcher)))
        pos-2 (dec (util/str->int (re-find matcher)))
        char (first (re-find matcher))
        phrase (re-find matcher)]
    (pr (get phrase pos-1))
    (pr (get phrase pos-2))
    (xor (= char (get phrase pos-1))
         (= char (get phrase pos-2)))))

(defn part-2 []
  (map (fn [p] {:policy p, :valid? (valid-password-2? p)}) input))

;; (valid-password-2? (first sample))
;; (valid-password-2? (second sample))
;; (valid-password-2? (last sample))
(valid-password-2? "14-15 d: dddddddddddddjmd")
(valid-password-2? "6-7 q: xqqqqqgq")
(part-2)
(count (filter :valid? (part-2)))
