function scr_draw(cardsToDraw, actualDrawing) {


	if(deckCount - cardsToDraw < 0) {return;}
	if(handCount >= handSizeLimit){
		if (macros.card_type[deck[deckCount-1,0]]= 2){
			momentum += 2
		}
		else if (macros.card_type[deck[deckCount-1,0]]= 0){
			mana += macros.origStat[deck[deckCount-1],0]
		}
		scr_message_stats();
		scr_mill_from_top(cardsToDraw);
		return;
	}

	for (i = 0; i< cardsToDraw; i++){

		scr_add_to_hand(player, deck[--deckCount,0], deck[deckCount,1])
		scr_remove_from_deck(deckCount)
		if(actualDrawing){
			for(var i = 0; i < 5; i++){
				scr_card_is_drawn(i, obj_player.hand[handCount,0])
			}		
		}
		
	}

	scr_message_hand_change();
	scr_message_deck_change();
	return;


}
