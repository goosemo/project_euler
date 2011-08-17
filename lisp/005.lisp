;2520 is the smallest number that can be divided by each of the numbers from 1
;to 10 without any remainder.
;
;What is the smallest number that is evenly divisible by all of the numbers
;from 1 to 20?

(defun make_list(limit)
    (if (> limit 1)
          (append (make_list (1- limit)) (list limit))
              (list 1)))


(defun is_factor (factor check)
  (eq 0 (mod check factor)))

(assert (eq T (is_factor 4 8)))
(assert (eq T (is_factor 3 2520)))
(assert (eq T (is_factor 7 2520)))
(assert (eq T (is_factor 10 2520)))

(defun divisiable_by_numbers (numbers check)
  (every #'(lambda (x) (is_factor x check)) numbers ))

(assert (eq T (divisiable_by_numbers (make_list 10) 2520)))

(defun find_smallest_iter (numbers step_by)
  (do ((runner step_by (+ runner step_by)))
    ((eq T (divisiable_by_numbers numbers runner)) runner)
    ))

(defun find_smallest (numbers last_answer)
  (if (not (null numbers))
    (do ((runner steps (1+ steps)))
      (eq runner steps
    ))))


(assert (eq 2520 (find_smallest (make_list 10))))
(print (reduce #'+ (make_list 10)))

;(print (mapcar #'(lambda (x) (find_smallest (make_list x))) (make_list 19)))
;(print (find_smallest (make_list 5)))
;(print (find_smallest (make_list 10)))
;(print (find_smallest (make_list 12)))
;(print (find_smallest (make_list 14)))
;(print (find_smallest (make_list 16)))
;(print (find_smallest (make_list 18)))
(print (find_smallest (make_list 19)))
(print (find_smallest (make_list 20)))

