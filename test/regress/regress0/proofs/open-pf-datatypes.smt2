; EXPECT: unsat
(set-logic ALL)
(declare-datatypes ((C 0)) (((r) (b))))
(declare-datatypes ((P 0)) (((a (f C) (s C)))))
(declare-fun p () P)
(declare-fun p2 () P)
(declare-fun p3 () P)
(declare-fun p4 () P)
(declare-fun p5 () P)
(assert (distinct p p2 p3 p4 p5))
(check-sat)
