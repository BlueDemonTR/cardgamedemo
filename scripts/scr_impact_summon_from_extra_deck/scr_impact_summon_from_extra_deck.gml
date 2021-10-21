function scr_summon_momentum_deck(player, momentumDeckPos, summonZone) {
	var
	cardNum = momentumDeck[momentumDeckPos, 0],
	artNum = momentumDeck[momentumDeckPos, 1];
	
	if(!scr_summon([cardNum, artNum], player, SummonImpact, "playerMomentumDeckToField", summonZone)){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
		return false;
	}	
	scr_remove_from_momentum_deck(player, momentumDeckPos);
	
	return player.fieldCard[summonZone];
}
