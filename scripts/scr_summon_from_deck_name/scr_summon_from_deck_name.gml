function scr_summon_from_deck_name(player, cardNum, summonZone) {
	with(player){
		for (var i = 0; i < deckCount; i++){
			if (deck[i, CardNumber] == cardNum && scr_limited_summon(deck[i, CardNumber])){
				return	scr_summon_from_deck(i, summonZone);
			}
		}
	}
	resolutionPile[resolutionPileCount-1,2] = 97
	return false;
}
