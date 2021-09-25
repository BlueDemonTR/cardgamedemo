function scr_remove_from_deck(argument0) {
	var temp1 = argument0;
	for (var i=temp1; i < deckCount; i++){
		deck[i,0] = deck[i+1,0];
		deck[i,1] = deck[i+1,1];
	}
	deckCount--;
	scr_message_deck_change();


}
