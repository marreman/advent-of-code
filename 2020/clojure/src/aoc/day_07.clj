(ns aoc.day-07
  (:require [clojure.string :as str]))

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

(def available-bag-types
  ["light red"
   "dark orange"
   "bright white"
   "muted yellow"
   "shiny gold"
   "dark olive"
   "vibrant plum"
   "faded blue"
   "dotted black"])

(defn parse-rule [s]
  (let [bags (re-seq (re-pattern (str/join "|" available-bag-types)) s)]
    [(first bags) (rest bags)]))

(defn parse-rules [s]
  (apply hash-map (mapcat parse-rule s)))

(defn part-1 [s]
  (let [rules (parse-rules s)]
    rules))

(comment
  (part-1 sample))
