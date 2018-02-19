#||
 CSCI 310 Organization of Programming Languages, Spring 2018
 
 Program #1: Functional Programming
 
 Programmer: Skyler Selfridge
 
 Date: 2/19/18

 ||#

(dribble "output.txt")


#|| #1 hlbackwards
Takes a list of s-expressions as input, and returns a list in which the order of the elements of the list is reversed.
Note that this function should only work on the elements of the list and not of any sublists
||#
(defun hlbackwards (L)
   (cond
      ((null L) nil)  ; base case
      (T  (append (hlbackwards (cdr L)) (list (car L))))
   )
)

#|| #2 llbackwards
takes a list of s-expressions as input, and returns a list in which the elements of every 
list and sublist are in reverse order.
||#
(defun llbackwards (L)
	(cond
		((null L) ())
		((listp (car L))(append (llbackwards (cdr L)) (list (llbackwards (car L)))))
		(T (append (llbackwards (cdr L)) (list (car L))))
	)
)

#|| #3 palindrome
takes a list as input and returns T if the list is a palindrome, ie reads the same in both directions.  
If it is not, it takes the input and converts it into a palindrome by reversing the input and appending it to itself, 
without duplicating the last element, and returns that list.
||#
(defun palindrome (L)
	(cond
		((equal L (llbackwards L)) T)
		(T (append L(cdr(llbackwards L))))
	)
)
#|| #4 ionah
Takes a single number as input and prints out the solution to the inverted disk  problem for that many disks.
||#
(defun iterate_ionah(n a b c)
	(cond
		(
			(> n 0)
			(iterate_ionah (- n 1) c b a)
			(format t "move disk from peg ~D to peg ~D~&" b a)
			(iterate_ionah (- n 1) a c b)
		)
	)
)

(defun ionah(n)
    (iterate_ionah n 3 1 2)
)

#|| #5 sequence
takes a single integer as input and prints out a list containing that many terms of the the sequence defined by:
2*sequence(n - 1) + 2*sequence(n - 2)
||#
(defun mysequence (n)
	(cond
		((equal n 1) '(0))
		((equal n 2) '(1))
		(T (append (mysequence (- n 1)) (list (dseq n))))
	)
)


(defun dseq (n)
	(cond
		((equal n 1) 0)
		((equal n 2) 1)
		(T (+(* 2 (dseq (- n 1))) (dseq (- n 2))))
	)
)	

#|| #6 permutations
Takes a list as input and generates a list containing all possible permutations of the list elements.
||#
(defun permutations (z &optional (remain z))
	(cond 
		((null remain) nil)
		((null (rest z)) (list z))
        (T (append
           (mapcar (lambda (l) (cons (first z) l)) (permutations (rest z)))
           (permutations (append (rest z) (list (first z))) (rest remain)))
		)
	)
)

#|| #7 Argue 
Takes statements that are typed in as a list and change the pronouns and negate the verbs.
||#
(defun argue (L)
	(cond
		((null L) ())
		((equal (car L) 'i) (append (list 'you ) (argue (cdr L))))
		((equal (car L) 'you)(append (list 'i )	(argue (cdr L))))
		((equal (car L) 'am) (append (list 'are 'not )(argue (cdr L))))
		((equal (car L) 'are) (append (list 'am 'not )(argue (cdr L))))	
		((equal (car L) 'arent) (append (list 'am ) (argue (cdr L))))	
		((equal (car L) 'is) (append (list 'is 'not ) (argue (cdr L))))
		((equal (car L) 'isnt) (append (list 'is )(argue (cdr L))))
		((equal (car L) 'your) (append (list 'my )(argue (cdr L))))
		((equal (car L) 'my) (append (list 'your )(argue (cdr L))))
		((equal (car L) 'mother) (append (list 'mother )(argue (cdr L))))
		((equal (car L) 'does) (append (list 'does 'not )(argue (cdr L))))
		((equal (car L) 'doesnt) (append (list 'does )(argue (cdr L))))
		(T L)		
	)
)

#|| #8 Bubblesort
Takes a list of numbers and returns the list in sorted order.
||#
(defun bubblesort (list)
	(cond
		((null list) ())
		(T(<= (length list) 1) list (let ((pivot (first list)))
		(append	(bubblesort (remove-if-not #'(lambda (x) (< x pivot)) list))
		(remove-if-not #'(lambda (x) (= x pivot)) list)
		(bubblesort (remove-if-not #'(lambda (x) (> x pivot)) list)))))
	)
)


;capitalize output stream
(setq *print-case* :capitalize)


