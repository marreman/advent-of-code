(ns aoc.util
  (:require [clojure.string :as str]))

(defn lines [s]
  (-> (str/trim s)
      (str/split #"\n")))

(defn str->int [s]
  (Integer/parseInt s))
