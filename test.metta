;; Define the necessary types and constructors
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

(: append (-> (List $a) (List $a) (List $a)))
(= (append Nil $ys) $ys)
(= (append (Cons $x $xs) $ys) (Cons $x (append $xs $ys)))

(: partial-insertion-sort-iset (-> Number (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (partial-insertion-sort-iset $k $lst)
   (partial-insertion-sort-helper $k $lst Nil))

(: partial-insertion-sort-helper (-> Number (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (partial-insertion-sort-helper $k Nil $sorted) $sorted)
(= (partial-insertion-sort-helper 0 $rest $sorted)
   (append $sorted $rest))
(= (partial-insertion-sort-helper $k (Cons $x $xs) $sorted)
   (partial-insertion-sort-helper (- $k 1) $xs (insert-sinst $x $sorted)))

(: partial-sort-instance-set (-> Number (InstanceSet Cscore) (InstanceSet Cscore)))
(= (partial-sort-instance-set $k (mkSInstSet $lst))
    (mkSInstSet (partial-insertion-sort-iset $k $lst)))

;; ✅ Only run partial sort (remove any other ! statements)
! (partial-sort-instance-set 2
    (mkSInstSet 
        (Cons 
            (mkSInst (mkPair (mkInst (Cons 1 Nil)) (mkCscore 1 5)))
            (Cons 
                (mkSInst (mkPair (mkInst (Cons 2 Nil)) (mkCscore 2 3)))
                (Cons 
                    (mkSInst (mkPair (mkInst (Cons 3 Nil)) (mkCscore 3 1)))
                    Nil
                )
            )
        )
    )
)
