if(end_phase && !end_phase_effects_resolved){
	
	end_phase_effects_resolved= true;
	if(selected_wheel=7 && !wheel_locked){
		momentum = max(0,momentum-5);
	}


	for(i=0; i < endPhaseCount; i++){
		
		if(endPhaseEffects[i]==56){//earthquake
			endPhaseChains[endPhaseChainCount,0] = 56
			endPhaseChains[endPhaseChainCount++,1] = 0
		}
	}
	scr_reset_limitations()
}
