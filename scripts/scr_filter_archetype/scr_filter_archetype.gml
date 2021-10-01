function scr_filter_archetype(filter_archetype1, filter_archetype2, targetMinLevel, targetMaxLevel, checkLimitedSummon) {
	//filtered_cards array includes the place of the cards in the deck not the cardNum
	//write "any" for filter_archetype1 for generic 
	j = 0;
	with(obj_player){
		for (var i = 0; i < deckCount; i++){
			if (filter_archetype1 = "any" || scr_check_archetype(deck[i,0],filter_archetype1) || scr_check_archetype(deck[i,0],filter_archetype2)){
				if (macros.origStat[deck[i,0], StatLevel] > targetMinLevel && macros.origStat[deck[i,0], StatLevel] < targetMaxLevel){	
					if(!checkLimitedSummon || scr_limited_summon(deck[i,0])){
						global.filtered_cards[j++] = i;
					}
				}			
			}
		}
	}
	filtered_card_count = j;



}
