(ns aoc.core
  (:require [clojure.string :as str]
            [clojure.set :as set]))

(defn log [x] (println x) x)

(defn split-on-newline [s]
  (-> (str/trim s)
      (str/split #"\n")))

(defn number->digits [n]
  (mapv #(Character/digit % 10) (str n)))

(defn cartesian-product [nums]
  (for [a nums
        b nums
        :when (not= a b)]
    [a b]))

;; Day 01


(def testinput "1721
979
366
299
675
1456")


(def nums (map #(Integer/parseInt %) (split-on-newline testinput)))

(println nums)

(defn pairs->sums [nums]
  (map (fn [[a b]]
         {:sum (+ a b)
          :prod (* a b)}) nums))


(def sums
  (->> (split-on-newline testinput)
       (map #(Integer/parseInt %))
       cart
       pairs->sums))



(defn d01 [path]
  (let [nums (map #(Integer/parseInt %) (split-on-newline (slurp path)))
        candidates (pairs->sums (cartesian-product nums))
        results (filter #(= 2020 (:sum %)) candidates)]
    results))

(d01 "../input/01")

;; (println input)


;; HELPERS
(def a (into #{} (map #(Integer/parseInt %) (split-on-newline (slurp "../input/01")))))

(println a)

;; (def a #{20 1 2000 1000})
(def b (into #{} (map #(- 2020 %) a)))
(apply * (set/intersection a b))

(* 1387 633)

;; 2020 - x
[2000 2019 20 1020]
