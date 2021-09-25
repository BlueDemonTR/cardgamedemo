function scr_summon_from_deck_name(cardNum, summonZone) {

	with(obj_player){
		for (var i = 0; i < deckCount; i++){
			if (deck[i,0] == cardNum && scr_limited_summon(deck[i,0])){
				return	scr_summon_from_deck(i, summonZone);
			}
		}
	}


}
