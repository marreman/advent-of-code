(ns aoc.day-04
  (:require [aoc.util :refer [str->int map-fns]]
            [clojure.string :as str]
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

(s/def ::byr #(<= 1920 (str->int %) 2002))
(s/def ::iyr #(<= 2010 (str->int %) 2020))
(s/def ::eyr #(<= 2020 (str->int %) 2030))
(s/def ::hgt (fn [s]
               (let [[_ n unit] (re-find #"(\d+)(cm|in)" s)]
                 (case unit
                   "cm" (<= 150 (str->int n) 193)
                   "in" (<= 59 (str->int n) 76)
                   false))))
(s/def ::hcl #(re-matches #"#[a-f0-9]{6}" %))
(s/def ::ecl #{"amb" "blu" "brn" "gry" "grn" "hzl" "oth"})
(s/def ::pid #(re-matches #"\d{9}" %))

(s/def ::passport
  (s/keys :req-un [::byr ::ecl ::eyr ::hcl ::hgt ::iyr ::pid]))

(defn parse-field [field]
  (map-fns [keyword identity] (str/split field #":")))

(defn parse-passport [passport]
  (->> (str/split passport #"\s+")
       (mapcat parse-field)
       (apply sorted-map)))

(defn part-2 [passports]
  (->> (map parse-passport passports)
       (filter #(s/valid? ::passport %))
       count))

;; See commit 57a752e for part 1, it's basically a simpler version of part 2.
(part-2 sample) ;; 2
(part-2 input) ;; 116
