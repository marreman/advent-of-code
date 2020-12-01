(ns aoc.day-01
  (:require [aoc.util :as util]
            [clojure.set :as set]))

(def sample
  [1721 979 366 299 675 1456])

(def input
  (map util/str->int (util/lines (slurp "../input/01"))))

(defn part-1 []
  (distinct
    (for [x input
          y input
          :when (= 2020 (+ x y))]
      (* x y))))

(defn part-1-alt []
  (let [a (set input)
        b (set (map #(- 2020 %) a))]
    (apply * (set/intersection a b))))

(defn part-2 []
  (distinct
    (for [x input
          y input
          z input
          :when (= 2020 (+ x y z))]
      (* x y z))))
