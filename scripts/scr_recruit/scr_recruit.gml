function scr_recruit(cardNum, artNum, summonZone){

	if(!scr_summon(cardNum, artNum, player, "effect", "recruit", summonZone)){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97;
		return;
	}
	return player.fieldCard[summonZone];
}
