function scr_draw(player, cardsToDraw, actualDrawing) {
	//Gets cards from the top of the deck to the player's hand, is also used for the scr_search function
	//Syntax
	//player: either obj_player or obj_opponent, chooses which player is drawing the card
	//cardsToDraw: int, how many cards will be drawn
	//actualDrawing: bool, false only when called by the search function
	//Rulings
	//If a card is drawn while the hand is full the card is milled instead
	//If the milled card is a monster you gain mana equal to it's level
	//If the milled card is a spell you gain two momentum

	if(player.deckCount - cardsToDraw < 0) {return;}
	if(player.handCount >= handSizeLimit){
		
		if(macros.card_type[player.deck[player.deckCount-1, CardNumber]] == TypeSpell){
			scr_give_player_stats(player, 0, 0, 0, 2)
		}
		else{
			scr_give_player_stats(player, 0, 0, macros.origStat[player.deck[player.deckCount-1, CardNumber], StatLevel], 2)
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
				scr_card_is_drawn(i, player.hand[player.handCount, CardNumber])
			}		
		}
		
	}

	scr_decide_hand_change(player);
	scr_decide_deck_change(player);
	return;
}
