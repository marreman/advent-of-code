(ns aoc.day-05
  (:require [aoc.util :refer [lines]]
            [clojure.set :as set]))

(def sample-1 "FBFBBFFRLR")
(def sample-2 "BFFFBBFRRR")
(def sample-3 "FFFBBBFRRR")
(def sample-4 "BBFFBBFRLL")

(def input (lines (slurp "../input/05")))

(defn find' [[curr-char & more-chars] nums]
  (let [middle (quot (count nums) 2)
        [lower-half upper-half] (split-at middle nums)]
    (case curr-char
      \F (find' more-chars lower-half)
      \L (find' more-chars lower-half)
      \B (find' more-chars upper-half)
      \R (find' more-chars upper-half)
      (first nums))
    ))

(defn find-seat [chars]
  (let [row (find' (take 7 chars) (range 128))
        col (find' (take-last 3 chars) (range 8))]
    (+ (* row 8) col)))

(defn part-1 []
  (last (sort (map find-seat input))))

(defn part-2 []
  ;; all-seats found by eyeballin' min and max of taken-seats
  ;; and hardcoding those numbers
  (let [all-seats (set (range 32 914))
        taken-seats (set (map find-seat input))]
    (first (set/difference all-seats taken-seats))))

(comment
  (find-seat sample-1) ;; 357
  (find-seat sample-2) ;; 567
  (find-seat sample-3) ;; 119
  (find-seat sample-4) ;; 820

  (part-1) ;; 913
  (part-2) ;; 717
  )
