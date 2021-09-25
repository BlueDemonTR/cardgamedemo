function scr_reset_limitations() {
	limitationExists= false;
	limitSummonsToCount = 0;
	for(i=0;i < 20; i++){
		for(j=0; j < 2; j++){
			limitSummonsTo[i,j] = 0;
		}
	}
	limitSummonsOfCount = 0;
	for(i=0;i < 20; i++){
		for(j=0; j < 2; j++){
			limitSummonsOf[i,j] = 0;
		}
	}

	limitSummoningCardCount = 0;
	for(i = 0; i < 20; i++){
		limitSummoningCard[i] = -1;
	}
	endPhaseCount = 0
	for (i = 1; i < macros.total_cards; i++){
		endPhaseEffects[i] = 0;
	}
	hoptCount = 0
	for (i = 0; i < macros.total_cards; i++){
		hardOncePerTurn[i] = false
	}

	wheel_locked = false;

	wheel_opt[1] = false;
	wheel_opt[2] = false;
	wheel_opt[3] = false;
	wheel_opt[4] = false;



}
