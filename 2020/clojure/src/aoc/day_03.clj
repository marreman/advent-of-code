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

(defn part-1 [m d-pos]
  (loop [[x y] [0 0], r '()]
    (if-let [row (get m y)]
      (recur (map + [x y] d-pos)
             (conj r (nth (cycle row) x)))
      ((frequencies r) \#))))

(defn part-2 [m]
  (* (part-1 m [1 1])
     (part-1 m [3 1])
     (part-1 m [5 1])
     (part-1 m [7 1])
     (part-1 m [1 2])))

(part-1 input [3 1]) ;; 159
(part-2 input) ;; 6419669520
