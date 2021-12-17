(define (problem mec_problem)
	(:domain mec)
	
	(:objects
		 b - barco m1 m2 - margem
	)

	(:init
		
		(barcoNa m1)
		(not(free b))
		
		(= (canibais m1) 3)
		(= (canibais m2) 0)
		(= (missionarios m1) 3)
		(= (missionarios m2) 0)
		
	)

	(:goal (and
		
		(barcoNa m2)
		(= (missionarios m2) 3)
		(= (canibais m2) 3)
		
	    )
	)
)