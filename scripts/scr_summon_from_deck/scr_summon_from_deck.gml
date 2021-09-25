function scr_summon_from_deck(deckPos, summonZone){
	var
	cardNum = deck[deckPos,0],
	artNum = deck[deckPos,1];
	
	scr_shuffle_deck()
	
	if(!scr_summon(cardNum, artNum, player, "effect", "playerDeckToField", summonZone)){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97;
		return;
	}
	
	scr_remove_from_deck(deckPos);

}