(ns aoc.day-04
  (:require [clojure.string :as str]
            [clojure.spec.alpha :as s]))

(def sample
  ["ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
   byr:1937 iyr:2017 cid:147 hgt:183cm"

   "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
   hcl:#cfa07d byr:1929"

   "hcl:#ae17e1 iyr:2013
   eyr:2024
   ecl:brn pid:760753108 byr:1931
   hgt:179cm"

   "hcl:#cfa07d eyr:2025 pid:166559648
   iyr:2011 ecl:brn hgt:59in"])

(def input
  (str/split (slurp "../input/04") #"\n\n"))

(s/def ::byr string?)
(s/def ::cid string?)
(s/def ::ecl string?)
(s/def ::eyr string?)
(s/def ::hcl string?)
(s/def ::hgt string?)
(s/def ::iyr string?)
(s/def ::pid string?)

(s/def ::passport
  (s/keys :req-un [::byr ::ecl ::eyr ::hcl ::hgt ::iyr ::pid]
          :opt-un [::cid]))

(defn parse-pair [s]
  (let [[key val] (str/split s #":")]
    [(keyword key) val]))

(defn parse [passport]
  (->> (str/split passport #"\s+")
       (mapcat parse-pair)
       (apply sorted-map)))

(defn part-1 [passports]
  (count (filter #(s/valid? ::passport %) (map parse passports))))

(part-1 sample) ;; 2
(part-1 input) ;; 200
