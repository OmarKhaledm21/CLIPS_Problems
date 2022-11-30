(deftemplate father
(slot name1)
(slot name2)
)

(deftemplate mother
(slot name1)
(slot name2)
)

(deftemplate parent
(slot name1)
(slot name2)
)

(deftemplate grandfather
(slot name1)
(slot name2)
)
(deftemplate grandmother
(slot name1)
(slot name2)
)

(deffacts facts
(father(name1 Ahmed)(name2 Mohamed))
(mother(name1 Mona)(name2 Ali))
(father(name1 Ali)(name2 Sara))
(father(name1 Hassan)(name2 Ahmed))
)

(defrule isParent
(or (father(name1 ?x)(name2 ?y))
    (mother(name1 ?x)(name2 ?y))
)
=>
(assert(parent(name1 ?x)(name2 ?y)))
)

(defrule isGrandfather
(father(name1 ?x)(name2 ?y))
(parent(name1 ?y)(name2 ?z))
=>
(assert(grandfather(name1 ?x)(name2 ?z)))
)

(defrule isGrandmother
(mother(name1 ?x)(name2 ?y))
(parent(name1 ?y)(name2 ?z))
=>
(assert(grandmother(name1 ?x)(name2 ?z)))
)

