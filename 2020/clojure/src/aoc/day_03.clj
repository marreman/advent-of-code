(ns aoc.day-03
  (:require [aoc.util :refer [lines]]))

(def sample
  ["..##......."
   "#...#...#.."
   ".#....#..#."
   "..#.#...#.#"
   ".#...##..#."
   "..#.##....."
   ".#.#.#....#"
   ".#........#"
   "#.##...#..."
   "#...##....#"
   ".#..#...#.#"])

(def input
  (lines (slurp "../input/03")))

(defn part-1 [m]
  (loop [x 0, y 0, r 0]
    (if-let [row (get m y)]
      (case (nth (cycle row) x)
        \. (recur (+ x 3) (+ y 1) r)
        \# (recur (+ x 3) (+ y 1) (+ r 1))
        nil (recur x (+ y 1) r))
      r)))

(part-1 input)
