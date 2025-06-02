; --- Filter elements less than or equal to a pivot
(: filter-le (-> (List Number) Number (List Number)))
(= (filter-le () $pivot) ())
(= (filter-le (:: $h $t) $pivot)
   (if (<= $h $pivot)
       (:: $h (filter-le $t $pivot))
       (filter-le $t $pivot)
   )
)

; --- Filter elements greater than a pivot
(: filter-gt (-> (List Number) Number (List Number)))
(= (filter-gt () $pivot) ())
(= (filter-gt (:: $h $t) $pivot)
   (if (> $h $pivot)
       (:: $h (filter-gt $t $pivot))
       (filter-gt $t $pivot)
   )
)

; --- Append two lists
(: append (-> (List $t) (List $t) (List $t)))
(= (append () $l) $l)
(= (append (:: $h $t) $l) 
   (:: $h (append $t $l))
)

; --- Quick sort implementation
(: quick-sort (-> (List Number) (List Number)))
(= (quick-sort ()) ()) ; base case: empty list
(= (quick-sort (:: $h ())) (:: $h ())) ; base case: single element
(= (quick-sort (:: $h $t))
   (let* (
           ($less-equal (filter-le $t $h))
           ($greater (filter-gt $t $h))

           ($left (quick-sort $less-equal))
           ($right (quick-sort $greater))
         ) 
         (append $left (:: $h $right)) 
   )
)

; Run the example for Test
! (quick-sort (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 (:: 99 (:: 0 (:: 14 ())))))))))