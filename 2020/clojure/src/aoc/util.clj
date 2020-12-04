(ns aoc.util
  (:require [clojure.string :as str]))

(defn log [x]
  (prn x)
  x)

(defn lines [s]
  (-> (str/trim s)
      (str/split #"\n")))

(defn str->int [s]
  (Integer/parseInt s))

(defn xor [x y]
  (and (or x y)
       (not= x y)))
