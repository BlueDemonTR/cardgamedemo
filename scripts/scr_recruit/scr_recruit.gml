function scr_recruit(cardNum, artNum, player, summonZone){
	//Summons a monster out of nowhere
	//Syntax:
	//cardNum: int, summoned card's number
	//artNum: int, which artwork will the card use
	//summonZone: int between 0 and field_card_zone - 1
	
if(!scr_summon([cardNum, artNum], player, SummonEffect, 0, summonZone)){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
		return;
	}
	return player.fieldCard[summonZone];
}
