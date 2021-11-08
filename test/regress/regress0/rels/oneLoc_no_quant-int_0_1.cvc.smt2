; EXPECT: sat
(set-option :incremental false)
(set-logic QF_UFDTFS)
(declare-datatypes ((Atom 0)) (((atom))))
(declare-fun t () (Set (Tuple Atom Atom)))
(declare-fun b () Atom)
(declare-fun a () Atom)
(declare-fun c () Atom)
(declare-fun J ((Set (Tuple Atom)) (Set (Tuple Atom Atom))) (Set (Tuple Atom)))
(declare-fun T ((Set (Tuple Atom Atom))) (Set (Tuple Atom Atom)))
(assert (let ((_let_1 (set.singleton (tuple a)))) (= (rel.join _let_1 t) (J _let_1 t))))
(assert (let ((_let_1 (set.singleton (tuple c)))) (not (= (rel.join _let_1 (rel.tclosure t)) _let_1))))
(check-sat)
