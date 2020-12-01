(ns aoc.util
  (:require [clojure.string :as str]))

(defn log [x] (println x) x)

(defn lines [s]
  (-> (str/trim s)
      (str/split #"\n")))

(defn number->digits [n]
  (mapv #(Character/digit % 10) (str n)))

(defn cart-prod [coll]
  (for [a coll
        b coll]
    [a b]))

(defn str->int [s]
  (Integer/parseInt s))
