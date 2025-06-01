; Quick Sort Algorithm in MeTTa (Fixed and Working)

; --- Concatenate two lists
(: concat (-> (List $t) (List $t) (List $t)))
(= (concat () $ys) $ys)
(= (concat (:: $h $t) $ys)
   (:: $h (concat $t $ys))
)

; --- Partition the list into two lists: less than pivot and greater or equal
(: partition (-> (List Number) Number (List Number) (List Number)))
(: partition-helper (-> (List Number) Number (List Number) (List Number) (List Number) (List Number)))

(= (partition $lst $pivot)
   (partition-helper $lst $pivot () () () ())
)

(= (partition-helper () $pivot $less $greater $out-less $out-greater)
   (let ()
     (= $out-less $less)
     (= $out-greater $greater)
   )
)

(= (partition-helper (:: $h $t) $pivot $less $greater $out-less $out-greater)
   (if (< $h $pivot)
       (partition-helper $t $pivot (:: $h $less) $greater $out-less $out-greater)
       (partition-helper $t $pivot $less (:: $h $greater) $out-less $out-greater)
   )
)

; --- Quick sort main function
(: quick-sort (-> (List Number) (List Number)))
(= (quick-sort ()) ())

(= (quick-sort (:: $pivot $rest))
   (let* (
           ($out-less ())
           ($out-greater ())
           () ; Needed to allow multiple bindings
           (partition $rest $pivot $out-less $out-greater)
           ($sorted-less (quick-sort $out-less))
           ($sorted-greater (quick-sort $out-greater))
         )
       (concat $sorted-less (:: $pivot $sorted-greater))
   )
)

; --- Example usage

! (quick-sort (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 ()))))))

; (= (index $x)
;    (let* (($z (superpose $x))
;          )
;             (println! $z)
;    )
; )
; !(index (::4 (:: 3 (:: 5 ()))))
; !(index (1 4 8 3 6 8) 4)