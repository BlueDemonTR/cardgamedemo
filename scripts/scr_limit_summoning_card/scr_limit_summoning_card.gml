function scr_limit_summoning_card(argument0) {
	var cardNum = argument0;

	with(player){
		limitationExists = true;
		limitSummoningCard[limitSummoningCardCount++] = cardNum;
	}


}
