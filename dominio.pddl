(define (domain mec)
    
	(:requirements
        :typing
		:fluents
	)
    
    (:types
		margem
        barco
       
    )

	(:predicates
		(mudaLado ?m1 ?m2 - margem)
		(free ?b - barco)
		(barcoNa ?m - margem)
		
	)

	(:functions
		(missionarios ?m - margem)
		(canibais ?m - margem)
		
		
	)
	
	
	(:action permiteEmbarque
    	:parameters (?b - barco)
    	:precondition (not(free ?b))
    	:effect (free ?b)
    )
    
    
    
    (:action VaoUmMissionarioUmCanibal
		:parameters (?b - barco ?margemAtual ?margemFutura - margem)
		:precondition (and (mudaLado ?margemAtual ?margemFutura) (barcoNa ?margemAtual) (free ?b) (>= (missionarios ?margemAtual) 1) (>= (canibais ?margemAtual) 1) (>= (missionarios ?margemFutura) (canibais ?margemFutura)) )
		:effect (and(not (barcoNa  ?margemAtual)) (barcoNa  ?margemFutura) (not(free ?b)) (increase (canibais ?margemFutura) 1) (increase (missionarios ?margemFutura) 1) (decrease (canibais ?margemAtual) 1) (decrease (missionarios ?margemAtual) 1) )
	)
	
	(:action VaiUmMissionario
		:parameters (?b - barco ?margemAtual ?margemFutura - margem )
		:precondition (and (mudaLado ?margemAtual ?margemFutura) (barcoNa ?margemAtual) (free ?b) (>= (missionarios ?margemAtual) 1) (>= (- (missionarios ?margemAtual) 1) (canibais ?margemAtual)) (>= (+ (missionarios ?margemFutura) 1) (canibais ?margemFutura)))
		:effect (and(not (barcoNa ?margemAtual))(barcoNa  ?margemFutura) (not(free ?b)) (increase (missionarios ?margemFutura) 1)(decrease (missionarios ?margemAtual) 1) )
	)

	(:action VaiUmMissionario_OR
		:parameters (?b - barco ?margemAtual ?margemFutura - margem )
		:precondition (and(mudaLado ?margemAtual ?margemFutura)(barcoNa ?margemAtual)(free ?b) (= (missionarios ?margemAtual) 1) (= (- (missionarios ?margemAtual) 1) 0) (>= (+ (missionarios ?margemFutura) 1) (canibais ?margemFutura)) )
		:effect (and (not (barcoNa ?margemAtual)) (barcoNa ?margemFutura) (not(free ?b)) (increase (missionarios ?margemFutura) 1) (decrease (missionarios ?margemAtual) 1) )
	)
	
	(:action VaoDoisMissionarios
		:parameters (?b - barco ?margemAtual ?margemFutura - margem )
		:precondition (and(mudaLado ?margemAtual ?margemFutura)(barcoNa ?margemAtual) (free ?b) (>= (missionarios ?margemAtual) 2)(>= (- (missionarios ?margemAtual) 2) (canibais ?margemAtual))(>= (+ (missionarios ?margemFutura) 2) (canibais ?margemFutura)))
		:effect (and(not (barcoNa  ?margemAtual)) (barcoNa  ?margemFutura) (not(free ?b)) (increase (missionarios ?margemFutura) 2)(decrease (missionarios ?margemAtual) 2))
	)

	(:action VaoDoisMissionarios_OR
		:parameters (?b - barco ?margemAtual ?margemFutura - margem)
		:precondition (and(mudaLado ?margemAtual ?margemFutura) (barcoNa  ?margemAtual) (free ?b) (= (missionarios ?margemAtual) 2) (= (- (missionarios ?margemAtual) 2) 0) (>= (+ (missionarios ?margemFutura) 2) (canibais ?margemFutura)) )
		:effect (and (not (barcoNa  ?margemAtual)) (barcoNa  ?margemFutura) (not(free ?b)) (increase (missionarios ?margemFutura) 2) (decrease (missionarios ?margemAtual) 2) )
	)

	(:action VaiUmCanibal
		:parameters (?b - barco ?margemAtual ?margemFutura - margem)
		:precondition (and(mudaLado ?margemAtual ?margemFutura) (barcoNa  ?margemAtual) (free ?b) (>= (canibais ?margemAtual) 1) (>= (missionarios ?margemFutura) (+ (canibais ?margemFutura) 1)) 	)
		:effect (and(not (barcoNa  ?margemAtual)) (barcoNa  ?margemFutura) (not(free ?b)) (increase (canibais ?margemFutura) 1) (decrease (canibais ?margemAtual) 1) )
	)

	(:action VaiUmCanibal_OR
		:parameters (?b - barco ?margemAtual ?margemFutura - margem)
		:precondition (and (mudaLado ?margemAtual ?margemFutura) (barcoNa  ?margemAtual) (free ?b) (>= (canibais ?margemAtual) 1) (= (missionarios ?margemFutura) 0) )
		:effect (and (not (barcoNa  ?margemAtual)) (barcoNa ?margemFutura) (not(free ?b)) (increase (canibais ?margemFutura) 1) (decrease (canibais ?margemAtual) 1) )
	)

	(:action VaoDoisCanibais
		:parameters (?b - barco ?margemAtual ?margemFutura - margem)
		:precondition (and (mudaLado ?margemAtual ?margemFutura) (barcoNa ?margemAtual) (free ?b) (>= (canibais ?margemAtual) 2) (>= (missionarios ?margemFutura) (+ (canibais ?margemFutura) 2)) )
		:effect (and (not (barcoNa  ?margemAtual)) (barcoNa  ?margemFutura) (not(free ?b)) (increase (canibais ?margemFutura) 2) (decrease (canibais ?margemAtual) 2) )
	)

	(:action VaoDoisCanibais_OR
		:parameters (?b - barco ?margemAtual ?margemFutura - margem)
		:precondition (and (mudaLado ?margemAtual ?margemFutura) (barcoNa ?margemAtual) (free ?b) (>= (canibais ?margemAtual) 2) (= (missionarios ?margemFutura) 0) )
		:effect (and (not (barcoNa  ?margemAtual)) (barcoNa  ?margemFutura) (not(free ?b)) (increase (canibais ?margemFutura) 2) (decrease (canibais ?margemAtual) 2) )
	)

	
)