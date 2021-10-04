function scr_draw(player, cardsToDraw, actualDrawing) {


	if(player.deckCount - cardsToDraw < 0) {return;}
	if(player.handCount >= handSizeLimit){
		if(macros.card_type[player.deck[player.deckCount-1,0]] == TypeSpell){
			scr_give_player_stats(player, 0, 0, 0, 2)
		}
		else{
			scr_give_player_stats(player, 0, 0, macros.origStat[player.deck[player.deckCount-1], StatLevel], 2)
		}
		scr_decide_stats(player);
		scr_mill_from_top(player, cardsToDraw);
		return;
	}

	for (i = 0; i< cardsToDraw; i++){

		scr_add_to_hand(player, player.deck[--player.deckCount])
		scr_remove_from_deck(player, player.deckCount)
		if(actualDrawing){
			for(var i = 0; i < player.field_zone_count; i++){
				scr_card_is_drawn(i, player.hand[player.handCount,0])
			}		
		}
		
	}

	scr_message_hand_change();
	scr_message_deck_change();
	return;


}
