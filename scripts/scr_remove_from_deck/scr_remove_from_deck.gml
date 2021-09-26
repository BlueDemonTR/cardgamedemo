function scr_remove_from_deck(deckPos) {
	for (var i=deckPos; i < deckCount; i++){
		deck[i,0] = deck[i+1,0];
		deck[i,1] = deck[i+1,1];
	}
	deckCount--;
	scr_message_deck_change();


}
