function scr_summon_momentum_deck(player, momentumDeckPos, summonZone) {
	var
	cardNum = momentumDeck[momentumDeckPos, 0],
	artNum = momentumDeck[momentumDeckPos, 1];
	
	if(!scr_summon([cardNum, artNum], player, "impact", "playerMomentumDeckToField", summonZone)){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
		return;
	}	
	scr_remove_from_momentum_deck(player, momentumDeckPos);
}
