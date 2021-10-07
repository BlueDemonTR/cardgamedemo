function scr_summon_momentum_deck(player, momentumDeckPos, summonZone) {
	var
	cardNum = momentum_deck[momentumDeckPos, CardNumber],
	artNum = momentum_deck[momentumDeckPos, ArtNumber];
	
	if(!scr_summon([cardNum, artNum], player, "impact", "playerMomentumDeckToField", summonZone)){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97;
		return;
	}	
	scr_remove_from_momentum_deck(player, momentumDeckPos);
}
