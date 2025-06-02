;; ---------------------
;; Remove one occurrence
;; ---------------------
(: remove-one (-> (List $t) $t (List $t)))
(= (remove-one () $x) ())
(= (remove-one (List $x) ()) (List $x))
(= (remove-one (:: $h $t) $x)
   (if (== $h $x)
       $t
       (:: $h (remove-one $t $x))
   )
)

;; ---------------------
;; Find minimum in list
;; ---------------------
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

;; ---------------------
;; List helpers: take, drop, append
;; ---------------------
(: take (-> Number (List $a) (List $a)))
(= (take 0 $lst) ())
(= (take $n ()) ())
(= (take $n (:: $x $xs)) (:: $x (take (- $n 1) $xs)))

(: drop (-> Number (List $a) (List $a)))
(= (drop 0 $lst) $lst)
(= (drop $n ()) ())
(= (drop $n (:: $x $xs)) (drop (- $n 1) $xs))

(: append (-> (List $a) (List $a) (List $a)))
(= (append () $ys) $ys)
(= (append (:: $x $xs) $ys) (:: $x (append $xs $ys)))

;; ---------------------
;; Selection sort (on full list)
;; ---------------------
(: selection-sort (-> (List Number) (List Number)))
(= (selection-sort ()) ())
(= (selection-sort (:: $h $t))
   (let* (
           ($min (find-min (:: $h $t)))
           ($rest (remove-one (:: $h $t) $min))
         )
       (:: $min (selection-sort $rest))
   )
)

;; ---------------------
;; Partial Selection Sort (only first N elements)
;; ---------------------
(: partial-selection-sort (-> Number (List Number) (List Number)))
(= (partial-selection-sort $n $lst)
   (append
     (selection-sort (take $n $lst)) ;; sort first n elements
     (drop $n $lst)                  ;; keep remaining as-is
   )
)

;; ---------------------
;; ✅ Test case
;; ---------------------
! (partial-selection-sort 3 (:: 12 (:: 34 (:: 1 (:: 13 (:: 5 (:: 7 (:: 3 (:: 0 (:: 8 (:: 6 ())))))))))))
