; Selection Sort Algorithm in MeTTa

; --- Remove one occurrence of an element from the list
(: remove-one (-> (List $t) $t (List $t)))
(= (remove-one () $x) ())
(= (remove-one (List $x) ()) (List $x))
(= (remove-one (:: $h $t) $x)
   (if (== $h $x)
       $t
       (:: $h (remove-one $t $x))
   )
)

; ! (remove-one (:: "Genna" (:: "Kal" ())) "Kal") ;Expected (:: "Genna" ())

; --- Find the minimum number in a list
(: find-min (-> (List Number) Number))
(: find-min-helper (-> (List Number) Number Number))
(= (find-min (:: $h $t)) (find-min-helper $t $h))
(= (find-min ()) ())

(= (find-min-helper () $min) $min)
(= (find-min-helper (:: $h $t) $min)
   (if (< $h $min)
       (find-min-helper $t $h)
       (find-min-helper $t $min)
   )
)

; --- Selection sort implementation
(: selection-sort (-> (List Number) (List Number)))
(= (selection-sort ()) ())
(= (selection-sort (:: $h $t))
   (let* (
           ($min (find-min (:: $h $t)))
           ($rest (remove-one (:: $h $t) $min))
         )
   ( 
    ; let () (println! ($rest)) ;; for check the work progress you can remove semicolen comment
       (:: $min (selection-sort $rest))
   )
)
)

! (selection-sort (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 ()))))))
