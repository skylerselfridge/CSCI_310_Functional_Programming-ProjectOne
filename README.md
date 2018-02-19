# CSCI_310_Functional_Programming-ProjectOne
Functional programming project for CSCI 310 in LISP
Programmer: Skyler Selfridge
Date: 02/19/2018

;; Dribble of #<IO TERMINAL-STREAM> started on 2018-02-19 16:46:39.
;; Loaded file project_one.lsp
T
[2]> (hlbackwards '(a (b c) ((d e (f) g) h i)))
(((D E (F) G) H I) (B C) A)
[3]> (llbackwards '(a (b c) ((d e (f)) g) h i))
(I H (G ((F) E D)) (C B) A)
[4]> (palindrome '(a b c (b) a))
(A B C (B) A (B) C B A)
[5]> (palindrome '(a (b c (d)) ((d) c b) a))
T
[6]> (ionah 3)
move disk from peg 1 to peg 3
move disk from peg 1 to peg 2
move disk from peg 3 to peg 2
move disk from peg 1 to peg 3
move disk from peg 2 to peg 1
move disk from peg 2 to peg 3
move disk from peg 1 to peg 3
Nil
[7]> (mysequence 7)
(1 2 5 12 29 70)
[8]> (permutations '(1 2 3))
((1 2 3) (1 3 2) (2 3 1) (2 1 3) (3 1 2) (3 2 1))
[9]> (argue '(you are a stupid computer))
(I Am Not A Stupid Computer)
[10]> (argue '(you are))
(I Am Not)
[11]> (argue '(are))
(Am Not)
[12]> (argue (I am a smart human))

*** - Eval: undefined function I
The following restarts are available:
USE-VALUE      :R1      Input a value to be used instead of (Fdefinition 'I).
RETRY          :R2      Retry
STORE-VALUE    :R3      Input a new value for (Fdefinition 'I).
ABORT          :R4      Abort main loop
Break 1 [13]> (argue '(I am a smart human))
(You Are Not A Smart Human)
Break 1 [13]> (argue '(your mother does wear army boots))
(My Mother Does Not Wear Army Boots)
Break 1 [13]> (argue '(you are argumentative))
(I Am Not Argumentative)
Break 1 [13]> (bubblesort '(1 4 2 8 5 7))
(1 2 4 5 7 8)
Break 1 [13]> 
