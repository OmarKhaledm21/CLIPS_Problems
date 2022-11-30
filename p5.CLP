(deftemplate square (slot id) (slot side-length))
(deftemplate rectangle (slot id) (slot width) (slot height))
(deftemplate circle (slot id) (slot radius))

(deffacts test 
(square (id A) (side-length 3))
(square (id B) (side-length 5))
(rectangle (id C) (width 2) (height 5))
(circle (id D) (radius 2))
(circle (id E) (radius 6)))

(deftemplate shapeArea(slot id)(slot area))
(deftemplate shapePerim(slot id)(slot perim))

(defrule calculateCircleArea
(circle (id ?x)(radius ?y))
=>
(assert(shapeArea (id ?x)
	(area (* 3.14 (* ?y ?y)) )
)))

(defrule calculateSquareArea
(square (id ?x)(side-length ?y))
=>
(assert(shapeArea (id ?x)
	(area (* ?y ?y))
)))

(defrule calculateRectangleArea
(rectangle (id ?x)(width ?y)(height ?z))
=>
(assert(shapeArea (id ?x)
	(area (* ?y ?z))
)))





(defrule calculateCirclePerim
(circle (id ?x)(radius ?y))
=>
(assert(shapePerim (id ?x)
	(perim (* 2 (* 3.14 ?y)) )
))
)

(defrule calculateRectanglePerim
(rectangle (id ?x)(width ?y)(height ?z))
=>
(assert(shapePerim (id ?x)
	(perim (* 2 (+ ?y ?z)) )
)))

(defrule calculateSquarePerim
(square (id ?x)(side-length ?y))
=>
(assert(shapePerim (id ?x)
	(perim (* 4 ?y))
)))




(deftemplate area_sum(slot value))
(deffacts sum_area_fact
(area_sum(value 0))
)

(defrule sumArea
?sarea <- (shapeArea (id ?i)(area ?a))
?num <- (area_sum(value ?v))
=>
(assert( shape ?i area is ?a ))
(bind ?new_area_sum (+ ?v ?a))
(retract ?sarea)
(modify ?num (value ?new_area_sum))
)



(deftemplate perim_sum(slot value))
(deffacts sum_perim_fact
(perim_sum(value 0))
)

(defrule sumPerim
?sperim <- (shapePerim (id ?i)(perim ?a))
?num <- (perim_sum(value ?v))
=>
(assert( shape ?i perimeter is ?a ))
(bind ?new_perim_sum (+ ?v ?a))
(retract ?sperim)
(modify ?num (value ?new_perim_sum))
)




