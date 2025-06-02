;; Define the necessary types and constructors
(: List (-> $a Type))
(: Nil (List $a))
(: Cons (-> $a (List $a) (List $a)))

(: Instance Type)
(: mkInst (-> (List Number) Instance))

(: Pair (-> $a $b Type))
(: mkPair (-> $a $b (Pair $a $b)))

(: Cscore Type)
(: mkCscore (-> Number Number Cscore))

(: ScoredInstance Type)
(: mkSInst (-> (Pair Instance Cscore) ScoredInstance))

(: InstanceSet Type)
(: mkSInstSet (-> (List ScoredInstance) InstanceSet))

;; Helper function to extract the second component of Cscore
(: get-second (-> ScoredInstance Number))
(= (get-second (mkSInst (mkPair $inst (mkCscore $first $second)))) $second)

;; Function to find and remove the minimum element from a list
(: extract-min (-> (List ScoredInstance) (Pair ScoredInstance (List ScoredInstance))))
(= (extract-min (Cons $x Nil)) (mkPair $x Nil))
(= (extract-min (Cons $x $xs))
    (let (($pair (extract-min $xs))
         ($min-rest (fst $pair))
         ($rest (snd $pair)))
        (if (<= (get-second $x) (get-second $min-rest))
            (mkPair $x (Cons $min-rest $rest))
            (mkPair $min-rest (Cons $x $rest))
        )
    )
)

;; Selection sort implementation
(: selection-sort (-> (List ScoredInstance) (List ScoredInstance)))
(= (selection-sort Nil) Nil)
(= (selection-sort $lst)
    (let (($pair (extract-min $lst))
         ($min (fst $pair))
         ($rest (snd $pair)))
        (Cons $min (selection-sort $rest))
    )
)

;; Wrapper function for InstanceSet
(: sort-instance-set (-> InstanceSet InstanceSet))
(= (sort-instance-set (mkSInstSet $lst))
    (mkSInstSet (selection-sort $lst))
)

;; Test case
! (sort-instance-set 
  (mkSInstSet 
    (Cons (mkSInst (mkPair (mkInst (Cons 10 Nil)) (mkCscore 10 50)))
    (Cons (mkSInst (mkPair (mkInst (Cons 9 Nil)) (mkCscore 9 25)))
    (Cons (mkSInst (mkPair (mkInst (Cons 8 Nil)) (mkCscore 8 40)))
    (Cons (mkSInst (mkPair (mkInst (Cons 7 Nil)) (mkCscore 7 10)))
    (Cons (mkSInst (mkPair (mkInst (Cons 6 Nil)) (mkCscore 6 70)))
    (Cons (mkSInst (mkPair (mkInst (Cons 5 Nil)) (mkCscore 5 15)))
    (Cons (mkSInst (mkPair (mkInst (Cons 4 Nil)) (mkCscore 4 35)))
    (Cons (mkSInst (mkPair (mkInst (Cons 3 Nil)) (mkCscore 3 60)))
    (Cons (mkSInst (mkPair (mkInst (Cons 2 Nil)) (mkCscore 2 5)))
    (Cons (mkSInst (mkPair (mkInst (Cons 1 Nil)) (mkCscore 1 20)))
    Nil))))))))))
))