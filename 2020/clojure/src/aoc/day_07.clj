(ns aoc.day-07
  (:require [clojure.string :as str]
            [clojure.pprint :refer [pprint]]))

(def sample
  ["light red bags contain 1 bright white bag, 2 muted yellow bags."
   "dark orange bags contain 3 bright white bags, 4 muted yellow bags."
   "bright white bags contain 1 shiny gold bag."
   "muted yellow bags contain 2 shiny gold bags, 9 faded blue bags."
   "shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags."
   "dark olive bags contain 3 faded blue bags, 4 dotted black bags."
   "vibrant plum bags contain 5 faded blue bags, 6 dotted black bags."
   "faded blue bags contain no other bags."
   "dotted black bags contain no other bags."])

(def input (str/split-lines (slurp "../input/07")))

(defn parse-bag-contents [contents]
  (let [[_ n bag] (re-find #"^(\d) (.*)$" contents)]
    (repeat (read-string n) bag)))

(defn parse-bag [s]
  (let [bags (str/split s #" bags contain | bags?, | bags?\.|no other")]
    [(first bags) (map parse-bag-contents (rest bags))]))

(defn parse-bags [s]
  (apply hash-map (mapcat parse-bag s)))

(comment
  (pprint (parse-bags sample)))
