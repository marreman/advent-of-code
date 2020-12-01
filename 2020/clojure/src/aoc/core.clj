(ns aoc.core
  (:require [aoc.util :as util]
            [clojure.set :as set]))


;; Day 01

(defn pairs->sums [nums]
  (map (fn [[a b]]
         {:sum (+ a b)
          :prod (* a b)}) nums))



(defn d01_v1 []
  (let [nums (map util/str->int (util/lines (slurp "../input/01")))
        candidates (pairs->sums (util/cart-prod nums))
        results (filter #(= 2020 (:sum %)) candidates)]
    results))

(d01_v1)

(defn d01_v2 []
  (let [a (set (map util/str->int (util/lines (slurp "../input/01"))))
        b (set (map #(- 2020 %) a))]
    (apply * (set/intersection a b))))

(d01_v2)
