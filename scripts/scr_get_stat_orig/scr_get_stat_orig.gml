function scr_get_stat_orig(cardNum, stat){
	if(macros.total_cards < cardNum){
		return;
	}
	if(variable_array_exists(macros.origStat, cardNum, stat)){
		return macros.origStat[cardNum, stat]
	}
	return macros.defaultStat[stat]
}