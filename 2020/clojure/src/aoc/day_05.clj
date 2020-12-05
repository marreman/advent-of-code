(ns aoc.day-05
  (:require [aoc.util :refer [lines]]
            [clojure.set :as set]))

(def sample-1 "FBFBBFFRLR")
(def sample-2 "BFFFBBFRRR")
(def sample-3 "FFFBBBFRRR")
(def sample-4 "BBFFBBFRLL")

(defn ->decimal [s]
  (Integer/parseInt
    (apply str (map {\F 0, \L 0, \B 1, \R 1} s)) 2))

(def input (lines (slurp "../input/05")))

(defn find-seat [chars]
  (let [[row col] (map ->decimal (split-at 7 chars))]
    (+ (* row 8) col)))

(defn part-1 []
  (apply max (map find-seat input)))

(defn part-2 []
  (let [taken-seats (set (map find-seat input))
        highest-taken-seat (apply max taken-seats)
        lowest-taken-seat (apply min taken-seats)
        all-seats (set (range lowest-taken-seat (inc highest-taken-seat)))]
    (first (set/difference all-seats taken-seats))))

(comment
  (find-seat sample-1) ;; 357
  (find-seat sample-2) ;; 567
  (find-seat sample-3) ;; 119
  (find-seat sample-4) ;; 820

  (part-1) ;; 913
  (part-2) ;; 717
  )
