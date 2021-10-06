function scr_info_to_instance(cardNum) {
	
	for(var i = 0; i < macros.stat_count; i++){
		if(variable_array_exists(macros.origStat,cardNum,i)){
			cardStat[i] = macros.origStat[cardNum,i]
		}else{
			cardStat[i] = 0;
			switch(i){
				case StatHP:
					cardStat[i] = cardStat[StatMaxHP];
				break;
				case StatXPerTurn:
					cardStat[i] = 1;
				break;
			}
		}
	}
	
	for(var i = 0; i < macros.status_count; i++){
		if(variable_array_exists(macros.origStatus,cardNum,i)){
			cardStatus[i] = macros.origStatus[cardNum,i]
		}else{
			cardStatus[i] = false;
		}
	}
	
		for(var i = 0; i < macros.origSharedEffectsCount[cardNum]; i++){
			cardSharedEffects[i] = macros.origSharedEffects[cardNum,i]
		}
	cardSharedEffectsCount = i
	for(var i = 0; i < macros.origArchetypeCount[cardNum]; i++){
		cardArchetype[i] = macros.origArchetype[cardNum,i]
	}
	cardArchetypeCount = i
}
