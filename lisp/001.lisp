
;If we list all the natural numbers below 10 that are multiples of 3 or 5, we
;get 3, 5, 6 and 9. The sum of these multiples is 23.
;
;Find the sum of all the multiples of 3 or 5 below 1000.
;
;

(defun multiple_of(check multiple)
  (eq 0 (mod check multiple)))

(defun of_3(num)
  (multiple_of num 3))

(defun of_5(num)
  (multiple_of num 5))

(defun either(num)
  (if (or (of_5 num) (of_3 num)) 
    T
    NIL))

(assert (either 12))
(assert (either 10))
(assert (either 15))

(defun sum_multiples(limit runner)
  (cond 
    ((> limit 0)
     (if (either limit)
       (sum_multiples (1- limit) (+ runner limit))
       (sum_multiples (1- limit) runner)))
     (t runner)))

(defun get_multiples_sum(limit)
  (sum_multiples (- limit 1) 0))

(defun sanity_check()
  (let (result)
    (setf result (get_multiples_sum 10))
    (assert (eq 23 result))
    (print result)))

(sanity_check)

(print (get_multiples_sum 1000))
