;; run with rlwrap sbcl --load lists.l

;; find last element
(defun last-element (list) 
  (if (null list)
      nil
    (if (null (rest list))
	list
      (last-element (rest list)))))

;; find last but one element
(defun last-but-one (list)
  (if (null list)
      nil
    (if (null (third list))
	(first list)
      (last-but-one (rest list)))))

;; count number of elements
(defun count-elements (list)
  (if (null list)
      0
    (+ (count-elements (rest list)) 1)))

;; flatten a list
(defun flatten (l)
  (cond ((null l) l)
	((atom l) (list l))
	(T (append (flatten (first l)) (flatten (rest l))))))

;; mirror a list
(defun mirror (l)
  (cond ((atom l) l)
	(T (append (mirror (rest l)) (list (mirror (first l)))))))

;; cons-end 
(defun cons-end (element l)
  (if (null l)
      (list element)
    (cons (first l) (cons-end element (rest l)))))

;; reverse a list
(defun reverse-list (l)
  (if (null l)
      nil
    (cons-end (car l) (reverse-list (rest l)))))

;; delete element from list
(defun delete-e (l e)
  (cond ((null l) nil)
	((eq (car l) e) (rest l))
	(T (append (list (first l)) (delete-e (rest l) e)))))

;; delete all occurrences from list
(defun delete-all (l e)
  (cond ((atom l) (error "L must be a list!"))
	((null l) nil)
	((eq (car l) e) (delete-e (rest l) e))
	(T (append (list (first l)) (delete-all (rest l) e)))))

;; delete all occurrences (depth)
(defun delete-depth (l e)
  (cond ((null l) l)
	((atom (car l))
	 (if (eq (car l) e) (delete-depth (cdr l) e)
	 (cons (car l) (delete-depth (cdr l) e))))
	(T (cons (delete-depth (car l) e) (delete-depth (cdr l) e)))))

;; return odd position elements
(defun odds (l)
  (if (null l)
      nil
    (cons (first l) (odds (cdr (cdr l))))))
 
;; return even position elements
(defun evens (l)
  (if (null l)
      nil
    (cons (second l) (evens (cdr (cdr l))))))

;; string to list
(defun string-to-list (JSONstring)
  (if (= (length JSONstring) 0)
      nil
    (cons (char JSONstring 0) (string-to-list (subseq JSONstring 1)))))

;; list to string
(defun list-to-string (charlist)
  (if (null charlist) 
      nil
    (concatenate 'string (string (car charlist)) (list-to-string (cdr charlist)))))

;; count numbers
(defun count-numbers (l)
  (cond ((null l) 0)
	((numberp (car l)) (1+ (count-numbers (cdr l))))
	(T (count-numbers (cdr l)))))

;; count numbers (depth)
(defun count-numbers-depth (l)
  (cond ((null l) 0)
	((numberp (car l)) (1+ (count-numbers-depth (cdr l))))
	((listp (car l)) (+ (count-numbers-depth (car l)) (count-numbers-depth (cdr l))))
	(T (count-numbers-depth (cdr l)))))

;; delete numbers (depth)
(defun delete-n (l)
  (cond ((null l) nil)
	((numberp (car l)) (delete-n (cdr l)))
	((listp (car l)) (cons (delete-n (car l)) (delete-n (cdr l))))
	(T (cons (car l) (delete-n (cdr l))))))

;; sum numbers (depth)
(defun sum (l)
  (cond ((null l) 0)
	((numberp l) l)
	(T (+ (sum (car l)) (sum (cdr l))))))

;; insert in order
(defun insert-in-order (e l)
  (cond ((null l) (list e))
	((> e (car l)) (cons (car l) (insert-in-order e (cdr l))))
	(T (cons e l))))

;; multiply
(defun scale-list (l f)
  (mapcar (lambda (e) (* e f)) l))

;; remove elements which satisfy pred
(defun nopred (pred l)
  (cond ((null l) '())
	((listp (car l))
	 (cons (nopred pred (car l)) (nopred pred (cdr l))))
	((ignore-errors (funcall pred (car l)))
	 (nopred pred (cdr l)))
	(T (cons (car l) (nopred pred (cdr l))))))

;; reduce
(defun r (fun l)
  (cond ((= (length l) 2)
	 (cons (funcall fun (car l) (cadr l)) nil))
	 (T (cons (funcall fun (car l) (second l))
		  (r fun (cdr (cdr l)))))))

;; true if there are no sublists
(defun sub (l)
  (cond ((null l) T)
	((listp (car l)) nil)
	(T (sub (cdr l)))))

;; remove consecutive duplicates
(defun compress (l)
  (cond ((null l) nil)
	((null (cdr l)) l)
	((eq (first l) (second l))
	 (compress (cdr l)))
	(T (cons (first l) (compress (cdr l))))))

;; duplicate all elements (depth)
(defun dup (l)
  (cond ((null l) nil)
	((listp (car l))
	 (cons (dup (car l)) (dup (cdr l))))
	(T (cons (car l) (cons (car l) (dup (cdr l)))))))

;; duplicate n times
(defun dupn (l n &optional (tot n))
  (cond ((null l) nil)
	((<= n 0) (dupn (cdr l) tot tot))
	(T (cons (car l) (dupn l (- n 1) tot)))))

;; remove n-th element
(defun removen (l n)
  (cond ((null l) nil)
	((= n 0) (cdr l))
	(T (cons (car l) (removen (cdr l) (- n 1))))))

;; list containing elements in a range
(defun range (lower upper)
  (cond ((> lower upper) (error "Error!"))
	((= lower upper) (cons lower nil))
	(T (cons lower (range (+ 1 lower) upper)))))

;; sum of all elements
(defun sum (l)
  (if (null l) 0
    (+ (car l) (sum (cdr l)))))

;; adds 1 to even numbers (depth)
(defun addeven (l)
  (cond ((null l) nil)
	((listp (car l)) (cons (addeven (car l)) (addeven (cdr l))))
	((and (numberp (car l)) (evenp (car l))) (cons (+ 1 (car l)) (addeven (cdr l))))
	(T (cons (car l) (addeven (cdr l))))))

;; doubles the odd numbers (depth)
(defun doubleodd (l)
  (cond ((null l) nil)
	((listp (car l)) (cons (doubleodd (car l)) (doubleodd (cdr l))))
	((and (numberp (car l)) (oddp (car l))) (cons (* 2 (car l)) (doubleodd (cdr l))))
	(T (cons (car l) (doubleodd (cdr l))))))

;; average with let
(defun avglet (l)
  (let ((x (sum l)))
    (/ x (length l))))

;; average with reduce
(defun avgr (l)
  (/ (reduce '+ l) (length l)))

;; lambda
;; f(x, y) = x (1 + x y)2 + y (1 - y) + (1 - y) (1 + x y)
(defun lambdafun (x y)
  ((lambda (a b)
     (+ (* x (* a a))
	(* y b)
	(* a b)))
   (+ 1 (* x y))
   (- 1 y)))

;; let
(defun letfun (x y)
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    (+ (* x (* a a)) (* b y) (* a b))))

;; let (B 2017)
(defun letb (x y)
  (let ((a (* x y))
	(b (* 4 y)))
    (+ (* x a) (* y (* b b)) (* a b))))

;; let (A 2017)
(defun leta (x y)
  (let ((b (* 2 y))
	(a (* x (+ 1 y))))
    (+ (* a (* x x)) (* b y) (* a b))))


(defun l1 (x y)
  (let ((a (+ x (* x y)))
	(b (* 4 x y)))
    (lambda (y x)
      (+ (* x a)
	 (* y (* b b))
	 (* a b)))))

(defun l2 (x y)
  ((lambda (a b)
     (lambda (y x)
      (+ (* x a)
	 (* y (* b b))
	 (* a b))))
   (+ x (* x y))
   (* 4 x y)))



;; ((a b) (c) ((d)))
;; (cons (cons 'a (cons 'b nil)) (cons (cons 'c nil) (cons (cons (cons 'd nil) nil) nil)))

;; (a (b) (c) ((d)) e f ((g)))
;; (cons 'a (cons (cons 'b nil) (cons (cons 'c nil) (cons (cons (cons 'd nil) nil) (cons 'e (cons 'f (cons (cons (cons 'g nil) nil) nil)))))))

;; ((a b ((c) d ((e)))))
;; (cons (cons (cons 'a (cons 'b (cons (cons (cons 'c nil) (cons 'd (cons (cons 'e) nil))) nil))) nil) nil)

;; (((a)) (b c d) ((e (f))))
;; (cons (cons (cons 'a nil) nil) (cons (cons 'b (cons 'c (cons 'd nil))) (cons (cons (cons 'e (cons (cons 'f nil) nil)) nil) nil)))

;; (a ((b)) c (d))
;; (cons 'a (cons (cons (cons 'b nil) nil) (cons 'c (cons (cons 'd nil) nil))))

;; (a (b) (c . 42) (d e))
;; (cons 'a (cons (cons 'b nil) (cons (cons 'c 42) (cons (cons 'd (cons 'e nil)) nil))))

;; (a (b c) (d e) f)
;; (cons 'a (cons (cons 'b (cons 'c nil)) (cons (cons 'd (cons 'e nil)) (cons 'f nil))))

;; (a (((b c d)) e))
;; (cons 'a (cons (cons (cons (cons 'b (cons 'c (cons 'd nil))) nil) (cons 'e nil)) nil))

;; (((a) b (c d)) e)
;; (cons (cons (cons 'a nil) (cons 'b (cons (cons 'c (cons 'd nil)) nil))) (cons 'e nil))

;; ((a) (b c) (d (e (f))))
;; (cons (cons 'a nil) (cons (cons 'b (cons 'c nil)) (cons (cons 'd (cons (cons 'e (cons (cons 'f nil) nil)) nil)) nil)))

;; (a ((b) c) ((d)) e)
;; (cons 'a (cons (cons (cons 'b nil) (cons 'c nil)) (cons (cons (cons 'd nil) nil) (cons 'e nil))))

;; (a b (c) (d ((e))))
;; (cons 'a (cons 'b (cons (cons 'c nil) (cons (cons 'd (cons (cons (cons 'e nil) nil) nil)) nil))))

;; (((((a b) c)) d))
;; (cons (cons (cons (cons (cons 'a (cons 'b nil)) (cons 'c nil)) nil) (cons 'd nil)) nil)

;; (a ((b) c d (e)))
;; (cons 'a (cons (cons (cons 'b nil) (cons 'c (cons 'd (cons (cons 'e nil) nil)))) nil))

;; ((((a) b c)) d (e))
;; (cons (cons (cons (cons 'a nil) (cons 'b (cons 'c nil))) nil) (cons 'd (cons (cons 'e nil) nil)))

;; ((a ((b c (d) (e (f))))) g)
;; (cons (cons 'a (cons (cons (cons 'b (cons 'c (cons (cons 'd nil) (cons (cons 'e (cons (cons 'f nil) nil)) nil)))) nil) nil)) (cons 'g nil))

;; ((a (((b)) c) d) (e))
;; (cons (cons 'a (cons (cons (cons (cons 'b nil) nil) (cons 'c nil)) (cons 'd nil))) (cons (cons 'e nil) nil))

;; (a (b ((c (d) (e (((f))))))))
;; (cons 'a (cons (cons 'b (cons (cons (cons 'c (cons (cons 'd nil) (cons (cons 'e (cons (cons (cons (cons 'f nil) nil) nil) nil)) nil))) nil) nil)) nil))

;; ((a (b (((c))) ((d)) (e))))
;; (cons (cons 'a (cons (cons 'b (cons (cons (cons (cons 'c nil) nil) nil) (cons (cons (cons 'd nil) nil) (cons (cons 'e nil) nil)))) nil)) nil)

;; (a ((b (c (((d (e ((((f)) g))))))))))
;; (cons 'a (cons (cons (cons 'b nil) (cons (cons 'c (cons (cons (cons (cons 'd (cons (cons 'e (cons (cons (cons (cons (cons 'f nil) nil) (cons 'g nil)) nil) nil)) nil)) nil) nil) nil)) nil)) nil))

;; ((a (b (((c d (e)) f) g)) (h)))
;; (cons (cons 'a (cons (cons 'b (cons (cons (cons (cons 'c (cons 'd (cons (cons 'e nil) nil))) (cons 'f nil)) (cons 'g nil)) nil)) (cons (cons 'h nil) nil))) nil)

;; (((a b ((c d) e))) f)
;; (cons (cons (cons 'a (cons 'b (cons (cons (cons 'c (cons 'd nil)) (cons 'e nil)) nil))) nil) (cons 'f nil))

;; ((((a b c d)) e))
;; (cons (cons (cons (cons 'a (cons 'b (cons 'c (cons 'd nil)))) nil) (cons 'e nil)) nil)

;; ((a b (c (d) ((e)))) f)
;; (cons (cons 'a (cons 'b (cons (cons 'c (cons (cons 'd nil) (cons (cons (cons 'e nil) nil) nil))) nil))) (cons 'f nil))

;; (a ((b (c (((d (e)) f (g))) h))))
;; (cons 'a (cons (cons (cons 'b (cons (cons 'c (cons (cons (cons (cons 'd (cons (cons 'e nil) nil)) (cons 'f (cons (cons 'g nil) nil))) nil) (cons 'h nil))) nil)) nil) nil))

;; (((a (b c)) ((d) (e (f (g))))) (h (i (j k))))
;; (cons (cons (cons 'a (cons (cons 'b (cons 'c nil)) nil)) (cons (cons (cons 'd nil) (cons (cons 'e (cons (cons 'f (cons (cons 'g nil) nil)) nil)) nil)) nil)) (cons (cons 'h (cons (cons 'i (cons (cons 'j (cons 'k nil)) nil)) nil)) nil))

;; (a (b (c)) (d (((e)) f)))
;; (cons 'a (cons (cons 'b (cons (cons 'c nil) nil)) (cons (cons 'd (cons (cons (cons (cons 'e nil) nil) (cons 'f nil)) nil)) nil)))
