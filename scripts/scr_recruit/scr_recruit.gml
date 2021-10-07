function scr_recruit(cardNum, artNum, summonZone){
	//Summons a monster out of nowhere
	//Syntax:
	//cardNum: int, summoned card's number
	//artNum: int, which artwork will the card use
	//summonZone: int between 0 and field_card_zone - 1
	
	if(!scr_summon([cardNum, artNum], player, "effect", "recruit", summonZone)){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97;
		return;
	}
	return player.fieldCard[summonZone];
}
