(ns aoc.day-01
  (:require [aoc.util :refer [lines str->int]]
            [clojure.set :as set]))

(def sample
  [1721 979 366 299 675 1456])

(def input
  (map str->int (lines (slurp "../input/01"))))

(defn part-1 []
  (distinct
    (for [x input
          y input
          :when (= 2020 (+ x y))]
      (* x y))))

;; Courtesy of https://github.com/nicevo
(defn part-1-alt []
  (let [xs (set input)
        ys (set (map #(- 2020 %) xs))]
    (apply * (set/intersection xs ys))))

(defn part-2 []
  (distinct
    (for [x input
          y input
          z input
          :when (= 2020 (+ x y z))]
      (* x y z))))

(part-1) ;; 877971
(part-2) ;; 203481432
