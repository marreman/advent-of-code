(ns aoc.day-05
  (:require [aoc.util :refer [lines]]))

(def sample-1 "FBFBBFFRLR")
(def sample-2 "BFFFBBFRRR")
(def sample-3 "FFFBBBFRRR")
(def sample-4 "BBFFBBFRLL")

(def input (lines (slurp "../input/05")))

(defn find' [[c & cs] rows]
  (let [[lower upper] (split-at (quot (count rows) 2) rows)]
    (case c
      \F (find' cs lower)
      \L (find' cs lower)
      \B (find' cs upper)
      \R (find' cs upper)
      (first rows))
    ))

(find' (take 7 sample-1) (range 128))
(find' (take 7 sample-2) (range 128))
(find' (take 7 sample-3) (range 128))

(find' (take-last 3 sample-1) (range 8))
(find' (take-last 3 sample-2) (range 8))
(find' (take-last 3 sample-3) (range 8))
(find' (take-last 3 sample-4) (range 8))

(defn find-seat [cs]
  (let [row (find' (take 7 cs) (range 128))
        col (find' (take-last 3 cs) (range 8))]
    (+ (* row 8) col)))

(find-seat sample-1)
(find-seat sample-2)
(find-seat sample-3)
(find-seat sample-4)

(defn part-1 []
  (last (sort (map find-seat input))))

(part-1)
