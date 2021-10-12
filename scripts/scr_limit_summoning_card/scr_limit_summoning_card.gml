function scr_limit_summoning_card(cardNum) {
	with(player){
		limitationExists = true;
		limitSummoningCard[limitSummoningCardCount++] = cardNum;
	}
}
