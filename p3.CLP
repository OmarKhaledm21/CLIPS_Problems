

(deftemplate student
(slot name)
(slot grade1)
(slot grade2)
(slot grade3)
(slot grade4)
)

(defrule get-students
=>
(open "output.txt" outputfile "w")
(close outputfile)
(open "input.txt" datafile "r")
(bind ?n (read datafile ))
    (while (neq ?n EOF)
	(bind ?g1 (read datafile ))
	(bind ?g2 (read datafile ))
	(bind ?g3 (read datafile ))
	(bind ?g4 (read datafile ))
	(assert(student (name ?n)(grade1 ?g1)(grade2 ?g2)(grade3 ?g3)(grade4 ?g4) ))
       (bind ?n (read datafile )))
    (close datafile )
)



(defrule calculateGPA
(student(name ?n)(grade1 ?g1)(grade2 ?g2)(grade3 ?g3)(grade4 ?g4))
=>
(open "output.txt" outputfile "a")
(bind ?total (/ (+ ?g1 (+ ?g2 (+ ?g3 ?g4))) 4))
(printout outputfile ?n " (" ?g1 " " ?g2" " ?g3" " ?g4" ) " ?total"" crlf)
(close outputfile)
)


