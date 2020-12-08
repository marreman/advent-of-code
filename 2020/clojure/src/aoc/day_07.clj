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
    [bag (read-string n)]))

(defn parse-bag [s]
  (let [bags (str/split s #" bags contain | bags?, | bags?\.|no other")]
    [(first bags) (apply hash-map (mapcat parse-bag-contents (rest bags)))]))

(defn parse-bags [s]
  (apply hash-map (mapcat parse-bag s)))

(defn part-1 [all-bags init-targets]
  (loop [found-so-far []
         targets init-targets]
    (let [found (filter #(some (set targets) (keys (second %))) all-bags)
          found-in-total (concat found-so-far (keys found))]
      (if (empty? found)
        (count (set found-in-total))
        (recur found-in-total (keys found))))))

(comment
  (part-1 (parse-bags input) ["shiny gold"]) ;; 274
  )
