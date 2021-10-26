function scr_copy_stats(copyMonster, pasteMonster, copiedStats){
	//Copies Copy Monster's selected stats to the Paste Monster
	//Syntax:
	//copyMonster and pasteMonster: has to be a field_card object
	//copiedStats: array with Stat numbers

	if(!(instance_exists(copyMonster) && instance_exists(pasteMonster))){return;}
	
	for(var i = 0; i < array_length(copiedStats); i++){
		scr_set_stat_card(pasteMonster.player, pasteMonster.position, copiedStats[i], copyMonster.getStat(copiedStats[i]))
	}
	scr_decide_field_card_stats(pasteMonster.player, pasteMonster.position);	
}
