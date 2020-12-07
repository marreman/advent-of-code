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

(defn parse-bag [s]
  (let [bags (str/split s #" bags contain | bags?, | bags?\.|no other")]
    [(first bags) (map #(subs % 2) (rest bags))]))

(defn parse-bags [s]
  (apply hash-map (mapcat parse-bag s)))

(defn look-in-bag [target contents]
  (loop [contents contents
         hits-so-far 0]
    (let [{new-hits true other-bags false} (group-by (partial = target) contents)
          total-hits (+ hits-so-far (count new-hits))]
      (pprint {:target target
               :contents contents
               :hits-so-far hits-so-far
               :new-hits new-hits
               :other-bags other-bags})
      (if (empty? other-bags)
        total-hits
        (do
          (println "Wants to recur")
          (println [other-bags total-hits]))
        #_(recur other-bags total-hits)))))

(defn part-1 [target unparsed-bags]
  (let [bags (parse-bags unparsed-bags)]
    (map #(look-in-bag target %) (vals bags))))

(comment
  (part-1 "shiny gold" sample))
