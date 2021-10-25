function scr_info_to_instance(cardNum) {
	
	for(var i = 0; i < macros.stat_count; i++){
		if(variable_array_exists(macros.origStat,cardNum,i) && macros.origStat[cardNum,i] != 0){
			scr_set_stat_card(player, position, i, macros.origStat[cardNum,i])
		}else{
			switch(i){
				case StatHP:
					scr_set_stat_card(player, position, i, getStat(StatMaxHP))
				break;
				default:
					scr_set_stat_card(player, position, i, macros.defaultStat[i])
				break;
			}
		}
	}
	
	for(var i = 0; i < macros.status_count; i++){
		if(variable_array_exists(macros.origStatus,cardNum,i)){
			cardStatus[i] = macros.origStatus[cardNum,i]
		}else{
			cardStatus[i] = macros.defaultStatus[i];
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
	
	if(false){
		cardSharedEffectsCount = cardArchetypeCount//This is here because I am sick of the syntax error pop up
	}	
}
