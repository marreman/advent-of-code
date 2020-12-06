(ns aoc.day-05
  (:require [clojure.string :as str]))

(def sample "abc

            a
            b
            c

            ab
            ac

            a
            a
            a
            a

            b")

(def input (slurp "../input/06"))

(defn part-1 [s]
  (apply + (map #(count (set (re-seq #"[a-z]" %))) (str/split s #"\n\n"))))

(part-1 sample) ;; 11
(part-1 input) ;; 6748
