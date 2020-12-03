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

(defn traverse [map' step]
  (loop [[x y] [0 0], seen '()]
    (if-let [row (get map' y)]
      (recur (map + [x y] step)
             (conj seen (nth (cycle row) x)))
      (get (frequencies seen) \#))))

(defn part-1 [map']
  (traverse map' [3 1]))

(defn part-2 [map']
  (* (traverse map' [1 1])
     (traverse map' [3 1])
     (traverse map' [5 1])
     (traverse map' [7 1])
     (traverse map' [1 2])))

(part-1 input) ;; 159
(part-2 input) ;; 6419669520
