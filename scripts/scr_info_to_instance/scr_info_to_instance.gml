function scr_info_to_instance(cardNum) {
	
	for(var i = 0; i < macros.stat_count; i++){
		scr_set_stat_card(player, position, i, scr_get_stat_orig(cardNum, i))
	}
	if(getStat(StatHP) == 0){
		scr_set_stat_card(player, position, StatHP, getStat(StatMaxHP))
	}
	
	for(var i = 0; i < macros.status_count; i++){
		scr_set_status_card(player, position, i, scr_get_status_orig(cardNum, i))
	}
	
	cardSharedEffects = []
	for(var i = 0; i < macros.origSharedEffectsCount[cardNum]; i++){
		cardSharedEffects[i] = macros.origSharedEffects[cardNum,i]
	}
	cardSharedEffectsCount = i
	
	cardArchetype = []
	for(var i = 0; i < macros.origArchetypeCount[cardNum]; i++){
		cardArchetype[i] = macros.origArchetype[cardNum,i]
	}
	cardArchetypeCount = i
	
	if(false){
		cardSharedEffectsCount = cardArchetypeCount//This is here because I am sick of the syntax error pop up
	}	
}
