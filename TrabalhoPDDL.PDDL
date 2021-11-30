(define (domain mec)
    (:requirements
    :typing
    :strips)
    
    (:types
    margem
    barco
    canibal
    missionario)
    
    (:predicates 
    
    (at-boat ?m - margem)
    (atM ?m - missionario ?m - margem)
    (atC ?c - canibal ?m - margem)
    (free ?b - barco)
    (carryM ?m - missionario ?b - barco)
    (carryC ?c - canibal ?b - barco) 
    
    )
    
    (:action mudaMargem
    :parameters(?m1 ?m2 - margem ?b1 ?b2 - barco)
    :precondition(and(at-boat ?m1) (not(free ?b1) or(not(free ?b2)) ) )
    :effect(and (not(at-boat ?m1)) (at-boat ?m2))
    )
    
    (:action embarqueDoisCanibais
    :parameters(?c1 ?c2 - canibal ?b1 ?b2 - barco ?m - margem)
    :precondition(and(free ?b1) (free ?b2) (at-boat ?m) (atC ?c1 ?m) (atC ?c2 ?m)  )
    :effect(and (not(free ?b1)) (not(free ?b2)))
    )
    
     (:action embarqueUmCanibal
    :parameters(?c1 - canibal ?b1 - barco ?m - margem)
    :precondition(and(free ?b1) (at-boat ?m) (atC ?c1 ?m)  )
    :effect(and (not(free ?b1)) ) 
    )
    
     (:action embarqueDoisMissionarios
    :parameters(?m1 ?m2 - missionario ?b1 ?b2 - barco ?m - margem)
    :precondition(and(free ?b1) (free ?b2) (at-boat ?m) (atC ?m1 ?m) (atC ?m2 ?m)  )
    :effect(and (not(free ?b1)) (not(free ?b2)))
    )
    
     (:action embarqueUmMissionario
    :parameters(?m1 - missionario ?b1 - barco ?m - margem)
    :precondition(and(free ?b1) (at-boat ?m) (atC ?m1 ?m)  )
    :effect(and (not(free ?b1)) ) 
    )
    
     (:action embarqueUmCanibalUmMissionario
    :parameters(?c1 - canibal ?m1 - missionario ?b1 ?b2 - barco ?m - margem)
    :precondition(and(free ?b1) (free ?b2) (at-boat ?m) (atC ?c1 ?m) (atC ?m1 ?m)  )
    :effect(and (not(free ?b1)) (not(free ?b2)))
    )
    
    (:action desembarqueDoisCanibais
    :parameters(?c1 ?c2 - canibal ?b1 ?b2 - barco ?m1 ?m2 - margem)
    :precondition(and(not(free ?b1)) (not(free ?b2)) (at-boat ?m1) (atC ?c1 ?m1) (atC ?c2 ?m1)  )
    :effect(and (free ?b1) (free ?b2) (not(atC ?c1 ?m1)) (not(atC ?c2 ?m1)) (atC ?c1 ?m2) (atC ?c2 ?m2) (not(at-boat ?m1)) (at-boat ?m2))
    )
    
    
     (:action desembarqueUmCanibal
    :parameters(?c1 - canibal ?b1 - barco ?m1 ?m2 - margem)
    :precondition(and(not(free ?b1)) (at-boat ?m1) (atC ?c1 ?m1)  )
    :effect(and (free ?b1) (not(at-boat ?m1)) (at-boat ?m2) (not(atC ?c1 ?m1)) (atC ?c1 ?m2)) 
    )
    
    
    (:action desembarqueDoisMissionarios
    :parameters(?mi1 ?mi2 - canibal ?b1 ?b2 - barco ?m1 ?m2 - margem)
    :precondition(and(not(free ?b1)) (not(free ?b2)) (at-boat ?m1) (atM ?mi1 ?m1) (atM ?mi2 ?m1)  )
    :effect(and (free ?b1) (free ?b2) (not(atC ?mi1 ?m1)) (not(atM ?mi2 ?m1)) (atM ?mi1 ?m2) (atM ?mi2 ?m2) (not(at-boat ?m1)) (at-boat ?m2))
    )
    
     (:action desembarqueUmMissionario
    :parameters(?mi1 - canibal ?b1 - barco ?m1 ?m2 - margem)
    :precondition(and(not(free ?b1)) (at-boat ?m1) (atM ?mi1 ?m1)  )
    :effect(and (free ?b1) (not(at-boat ?m1)) (at-boat ?m2) (not(atM ?mi1 ?m1)) (atM ?mi1 ?m2)) 
    )
    
    (:action desembarqueUmCanibalUmMissionario
    :parameters(?c1 - canibal ?mi1 - missionario ?b1 ?b2 - barco ?m1 ?m2 - margem)
    :precondition(and(not(free ?b1)) (not(free ?b2)) (at-boat ?m1) (atM ?mi1 ?m1) (atC ?c1 ?m1)  )
    :effect(and (free ?b1) (free ?b2) (not(atC ?c1 ?m1)) (not(atM ?mi1 ?m1)) (atC ?c1 ?m2) (atM ?mi1 ?m2) (not(at-boat ?m1)) (at-boat ?m2))
    )
    
    )
    
    
    
    %% Verificar a necessidade da ação mudaMargem já que isto é feito nas ações de desembarque;
	%% Nesta descrição ainda não está especificado a condição de numero de canibais e nas margens
	%% Penso em representar o numero de missionarios e canibais em apenas uma das margens já que a outra é dependente disso;
	
    
    
    