; COMMAND-LINE: --strings-exp --re-elim
; EXPECT: sat
(set-info :smt-lib-version 2.6)
(set-option :produce-models true)
(set-logic UFDTSLIA)
(declare-datatypes ((StringRotation 0)(StringRotation2 0)) (((StringRotation$C_StringRotation (StringRotation$C_StringRotation$sr String)))((StringRotation2$C_StringRotation2 (StringRotation2$C_StringRotation2$sr1 StringRotation) (StringRotation2$C_StringRotation2$sr2 StringRotation)))))

(define-fun f1005$isValid_string((x$$1008 String)) Bool true)
(define-fun f1035$isValid_StringRotation((x$$1038 StringRotation)) Bool (and (f1005$isValid_string (StringRotation$C_StringRotation$sr x$$1038)) (or (or (or (= (StringRotation$C_StringRotation$sr x$$1038) "0 deg") (= (StringRotation$C_StringRotation$sr x$$1038) "90 deg")) (= (StringRotation$C_StringRotation$sr x$$1038) "180 deg")) (= (StringRotation$C_StringRotation$sr x$$1038) "270 deg"))))
(define-fun f1121$isValid_StringRotation2((x$$1124 StringRotation2)) Bool (and (f1035$isValid_StringRotation (StringRotation2$C_StringRotation2$sr1 x$$1124)) (f1035$isValid_StringRotation (StringRotation2$C_StringRotation2$sr2 x$$1124))))

(declare-fun $OutSR$1356$3$1$() StringRotation2)
(assert (f1121$isValid_StringRotation2 $OutSR$1356$3$1$))

(assert (let ((_let_1 (re.* (re.union (re.range "\u{0}" "\u{9}") (re.range "\u{b}" "\u{c}") (re.range "\u{e}" "\u{7f}"))))) (let ((_let_2 (StringRotation2$C_StringRotation2$sr2 $OutSR$1356$3$1$))) (let ((_let_3 (StringRotation$C_StringRotation$sr _let_2))) (let ((_let_4 (re.union (re.range "n" "~") (re.range " " "m")))) (let ((_let_5 (re.union (re.range "u" "~") (re.range " " "t")))) (let ((_let_6 (re.union (re.range "<" "~") (re.range " " ";")))) (let ((_let_7 (StringRotation2$C_StringRotation2$sr1 $OutSR$1356$3$1$))) (let ((_let_8 (StringRotation$C_StringRotation$sr _let_7))) (let ((_let_9 (re.union (re.range "s" "~") (re.range " " "r")))) (let ((_let_10 (re.union (re.range "{" "~") (re.range " " "z")))) (and ((_ is StringRotation2$C_StringRotation2) $OutSR$1356$3$1$) (and (and ((_ is StringRotation$C_StringRotation) _let_7) (or (str.in_re _let_8 (re.++ _let_5 (re.union (re.range "K" "~") (re.range " " "J")) (re.union (re.range "L" "~") (re.range " " "K")) (re.union (re.range "y" "~") (re.range " " "x")) _let_10)) (or (str.in_re _let_8 (re.++ _let_9 _let_10 _let_5)) (or (str.in_re _let_8 _let_6) (or (str.in_re _let_8 (re.++ (re.union (re.range "&" "~") (re.range " " "%")) (re.range " " "~"))) (or (str.in_re _let_8 (re.++ (re.union (re.range "`" "~") (re.range " " "_")) _let_9 (re.union (re.range "1" "~") (re.range " " "0")) (re.union (re.range "_" "~") (re.range " " "^")))) (str.in_re _let_8 _let_1))))))) (and ((_ is StringRotation$C_StringRotation) _let_2) (or (str.in_re _let_3 (re.++ _let_6 (re.union (re.range "F" "~") (re.range " " "E")) _let_5 (re.union (re.range "P" "~") (re.range " " "O")))) (or (str.in_re _let_3 (re.union (re.range "E" "~") (re.range " " "D"))) (or (str.in_re _let_3 (re.++ (re.union (re.range "x" "~") (re.range " " "w")) _let_4 (re.union (re.range "d" "~") (re.range " " "c")) (re.union (re.range "]" "~") (re.range " " "\u{5c}")) (re.union (re.range "\u{5c}" "~") (re.range " " "[")))) (or (str.in_re _let_3 (re.++ (re.union (re.range ":" "~") (re.range " " "9")) (re.union (re.range "+" "~") (re.range " " "*")))) (or (str.in_re _let_3 (re.++ (re.union (re.range "." "~") (re.range " " "-")) _let_4 (re.union (re.range "|" "~") (re.range " " "{")))) (str.in_re _let_3 _let_1))))))))))))))))))))

(check-sat)
