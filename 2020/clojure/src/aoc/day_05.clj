(ns aoc.day-05)

(def sample-1 "FBFBBFFRLR")
(def sample-2 "BFFFBBFRRR")
(def sample-3 "FFFBBBFRRR")
(def sample-4 "BBFFBBFRLL")

(defn find-row [[c & cs] lower upper]
  (let [middle (+ (quot (- upper lower) 2) lower)]
    (prn {:c c, :cs cs, :lower lower, :middle middle, :upper upper})
    (if (empty? cs)
      middle
      (case c
        \F (find-row cs lower middle)
        \B (find-row cs middle upper)))))

(comment
  (find-row (take 7 sample-1) 0 127)
  (find-row (take 7 sample-2) 0 127)
  (find-row (take 7 sample-3) 0 127)
  (find-row (take 7 sample-4) 0 127)
  )

(defn find-column [[c & cs] lower upper]
  (let [middle (+ (quot (- upper lower) 2) lower)]
    (prn {:c c, :cs cs, :lower lower, :middle middle, :upper upper})
    (if (empty? cs)
      middle
      (case c
        \L (find-column cs lower middle)
        \R (find-column cs middle upper)))))

(comment
  (find-column (take-last 3 sample-1) 0 7)
  (find-column (take-last 3 sample-2) 0 7)
  (find-column (take-last 3 sample-3) 0 7)
  (find-column (take-last 3 sample-4) 0 7)
  )
