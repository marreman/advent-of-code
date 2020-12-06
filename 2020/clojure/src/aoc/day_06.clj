(ns aoc.day-05
  (:require [clojure.string :as str]
            [clojure.set :as set]))

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

(defn all-answers [s]
  (map #(str/split % #"\n") (str/split s #"\n\n")))

(defn part-2 [s]
  (apply + (map #(count (apply set/intersection (map set %))) (all-answers s))))

(part-1 sample) ;; 11
(part-1 input) ;; 6748

;; (part-2 sample) ;; Sample doesn't work with part-2 because of white space in the string
(part-2 input) ;; 3445
