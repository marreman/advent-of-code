(ns aoc.core
  (:require [clojure.string :as str]))

(def input (slurp "../input/dummy"))

(-> (str/trim input)
    (str/split #","))

(+ 1 1)

