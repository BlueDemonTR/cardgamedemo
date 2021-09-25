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
		hand[handCount,0] = deck[--deckCount,0];
		hand[handCount,1] = deck[deckCount,1];
	
		deck[deckCount,0] = 0;
		deck[deckCount,1] = 0;

		handCard[handCount] = instance_create_depth(deck_x, deck_y, -handCount-2, obj_card);
		with(handCard[handCount]){
		
			card_drawn = true;
			hand_position = player.handCount;
			cardNum = player.hand[hand_position,0];
			artNum = player.hand[hand_position,1];
		}
		if(actualDrawing){
			for(var i = 0; i < 5; i++){
				scr_card_is_drawn(i, obj_player.hand[handCount,0])
			}		
		}
		handCount++;
	}

	scr_message_hand_change();
	scr_message_deck_change();
	return;


}
