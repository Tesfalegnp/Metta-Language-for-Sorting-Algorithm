;; -----------------------
;; Type Definitions
;; -----------------------

(: List (-> $a Type))
(: Nil (List $a))
(: Cons (-> $a (List $a) (List $a)))

(: Size Type)
(: mkSize (-> Number Size))

(: Instance Type)
(: mkInst (-> (List Number) Instance))

(: Pair (-> $a $b Type))
(: mkPair (-> $a $b (Pair $a $b)))

(: Cscore Type)
(: mkCscore (-> Number Number Cscore))

(: ScoredInstance (-> $score Type))
(: mkSInst (-> (Pair Instance $score) (ScoredInstance $score)))

(: InstanceSet (-> $score Type))
(: mkSInstSet (-> (List (ScoredInstance $score)) (InstanceSet $score)))

;; -----------------------
;; Utility Functions
;; -----------------------

(: get-second-score (-> (ScoredInstance Cscore) Number))
(= (get-second-score (mkSInst (mkPair $inst (mkCscore $first $second)))) $second)

(: insert-sinst (-> (ScoredInstance Cscore) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (insert-sinst $x Nil) (Cons $x Nil))
(= (insert-sinst $x (Cons $y $ys))
    (if (<= (get-second-score $x) (get-second-score $y))
        (Cons $x (Cons $y $ys))
        (Cons $y (insert-sinst $x $ys))
    )
)

(: insertion-sort-iset (-> (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (insertion-sort-iset Nil) Nil)
(= (insertion-sort-iset (Cons $x $xs))
    (insert-sinst $x (insertion-sort-iset $xs))
)

;; -----------------------
;; List Processing Helpers
;; -----------------------

(: append (-> (List $a) (List $a) (List $a)))
(= (append Nil $ys) $ys)
(= (append (Cons $x $xs) $ys) (Cons $x (append $xs $ys)))

(: take (-> Number (List $a) (List $a)))
(= (take 0 $lst) Nil)
(= (take $n Nil) Nil)
(= (take $n (Cons $x $xs)) (Cons $x (take (- $n 1) $xs)))

(: drop (-> Number (List $a) (List $a)))
(= (drop 0 $lst) $lst)
(= (drop $n Nil) Nil)
(= (drop $n (Cons $x $xs)) (drop (- $n 1) $xs))

;; -----------------------
;; Partial Sort Function
;; -----------------------

(: partial-sort-instance-set (-> (InstanceSet Cscore) (InstanceSet Cscore)))
(= (partial-sort-instance-set (mkSInstSet $lst))
    (mkSInstSet 
        (append 
            (insertion-sort-iset (take 5 $lst))
            (drop 5 $lst)
        )
    )
)

;; -----------------------
;; Test Case (10 Instances)
;; -----------------------

! (partial-sort-instance-set 
  (mkSInstSet 
    (Cons (mkSInst (mkPair (mkInst (Cons 10 Nil)) (mkCscore 10 50)))
    (Cons (mkSInst (mkPair (mkInst (Cons 9 Nil))  (mkCscore 9 25)))
    (Cons (mkSInst (mkPair (mkInst (Cons 8 Nil))  (mkCscore 8 40)))
    (Cons (mkSInst (mkPair (mkInst (Cons 7 Nil))  (mkCscore 7 10)))
    (Cons (mkSInst (mkPair (mkInst (Cons 6 Nil))  (mkCscore 6 70)))
    (Cons (mkSInst (mkPair (mkInst (Cons 5 Nil))  (mkCscore 5 15)))
    (Cons (mkSInst (mkPair (mkInst (Cons 4 Nil))  (mkCscore 4 35)))
    (Cons (mkSInst (mkPair (mkInst (Cons 3 Nil))  (mkCscore 3 60)))
    (Cons (mkSInst (mkPair (mkInst (Cons 2 Nil))  (mkCscore 2 5)))
    (Cons (mkSInst (mkPair (mkInst (Cons 1 Nil))  (mkCscore 1 20)))
          Nil))))))))))
  )
)

                    ;; The Expected Out Put like 

; (mkSInstSet 
;   (Cons (mkSInst (mkPair (mkInst (Cons 7 Nil))  (mkCscore 7 10)))  ;; Sorted first
;   (Cons (mkSInst (mkPair (mkInst (Cons 9 Nil))  (mkCscore 9 25)))  ;; Sorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 8 Nil))  (mkCscore 8 40)))  ;; Sorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 10 Nil)) (mkCscore 10 50))) ;; Sorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 6 Nil))  (mkCscore 6 70)))  ;; Sorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 5 Nil))  (mkCscore 5 15)))  ;; Unsorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 4 Nil))  (mkCscore 4 35)))  ;; Unsorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 3 Nil))  (mkCscore 3 60)))  ;; Unsorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 2 Nil))  (mkCscore 2 5)))   ;; Unsorted
;   (Cons (mkSInst (mkPair (mkInst (Cons 1 Nil))  (mkCscore 1 20)))  ;; Unsorted
;         Nil))))))))))
; )
