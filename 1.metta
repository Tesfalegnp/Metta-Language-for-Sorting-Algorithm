; Quick Sort Algorithm in MeTTa

; --- Append two lists
(: append (-> (List $t) (List $t) (List $t)))
(= (append () $l) $l)
(= (append (:: $h $t) $l) (:: $h (append $t $l)))

; ! (append (:: 1 (:: 2 ())) (:: 3 (:: 4 ()))) ; Expected (:: 1 (:: 2 (:: 3 (:: 4 ()))))

; --- Filter elements less than or equal to a pivot
(: filter-le (-> (List Number) Number (List Number)))
(= (filter-le () $pivot) ())
(= (filter-le (:: $h $t) $pivot)
    (if (<= $h $pivot)
        (:: $h (filter-le $t $pivot))
        (filter-le $t $pivot)
    )
)

; !(filter-le (:: 5 (:: 2 (:: 8 (:: 1 ())))) 4) ; Expected (:: 2 (:: 1 ()))


; --- Filter elements greater than a pivot
(: filter-gt (-> (List Number) Number (List Number)))
(= (filter-gt () $pivot) ())
(= (filter-gt (:: $h $t) $pivot)
    (if (> $h $pivot)
        (:: $h (filter-gt $t $pivot))
        (filter-gt $t $pivot)
    )
)

; ! (filter-gt (:: 5 (:: 2 (:: 8 (:: 1 ())))) 4) ; Expected (:: 5 (:: 8 ()))

; --- Quick sort implementation
(: quick-sort (-> (List Number) (List Number)))
(= (quick-sort ()) ())
(= (quick-sort (:: $h ())) (:: $h ())) ; Base case for single element list
(= (quick-sort (:: $h $t))
    (let* (
            ($pivot $h)
            ($less-equal (filter-le $t $pivot))
            ($greater (filter-gt $t $pivot))
            ($sorted (append (quick-sort $less-equal) (:: $pivot (quick-sort $greater))))
          ) $sorted
        ;   ( $less-equal :: $pivot (quick-sort $greater))
        ; (append (quick-sort $less-equal) (:: $pivot (quick-sort $greater)))
    )
)
; !(quick-sort (:: 5 ()))
! (quick-sort (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 (:: 99 (:: 0 ()))))))))