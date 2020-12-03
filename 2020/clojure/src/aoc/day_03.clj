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

(defn part-1 [m [dx dy]]
  (loop [x 0, y 0, r 0]
    (if-let [row (get m y)]
      (case (nth (cycle row) x)
        \. (recur (+ x dx) (+ y dy) r)
        \# (recur (+ x dx) (+ y dy) (+ r 1)))
      r)))

(defn part-2 [m]
  (* (part-1 m [1 1])
     (part-1 m [3 1])
     (part-1 m [5 1])
     (part-1 m [7 1])
     (part-1 m [1 2])))

(part-1 input [3 1]) ;; 159
(part-2 input) ;; 6419669520
