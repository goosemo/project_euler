
;The sum of the squares of the first ten natural numbers is,
;1^(2) + 2^(2) + ... + 10^(2) = 385
;
;The square of the sum of the first ten natural numbers is,
;(1 + 2 + ... + 10)^(2) = 55^(2) = 3025
;
;Hence the difference between the sum of the squares of the first ten natural
;numbers and the square of the sum is 3025 − 385 = 2640.
;
;Find the difference between the sum of the squares of the first one hundred
;natural numbers and the square of the sum.


(defun power (x n)
  (cond    
    ((= n 0) 1)
    ((= n 1) x)    
    (T (* x (power x (- n 1))))))

(assert (eq  8 (power 2 3)))
(assert (eq 16 (power 2 4)))

(defun square (x)
  (power x 2))

(assert (eq  4 (square 2)))
(assert (eq 25 (square 5)))

(defun sum_list(numbers)
  (if (not (null numbers))
    (+ (car numbers) (sum_list (cdr numbers)))
    0
    ))

(assert (eq 10 (sum_list (list 1 2 3 4))))

(defun square_list(numbers)
  (mapcar #'square numbers))

(assert (equal (list 1 4 9 16) (square_list (list 1 2 3 4))))

(defun make_list(limit)
  (if (> limit 1)
    (append (make_list (1- limit)) (list limit))
    (list 1)))

(assert (equal (list 1 2 3 4 5) (make_list 5)))

(defun diff_sums (numbers)
  (- (square (sum_list numbers)) (sum_list (square_list numbers))))

(assert (eq  385 (sum_list (square_list (make_list 10)))))
(assert (eq 3025 (square (sum_list (make_list 10)))))
(assert (eq 2640 (diff_sums (make_list 10))))

(print (diff_sums (make_list 100)))
