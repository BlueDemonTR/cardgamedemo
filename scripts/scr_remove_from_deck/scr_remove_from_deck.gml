function scr_remove_from_deck(player, deckPos) {
	for (var i = deckPos; i < player.deckCount; i++){
		deck[i] = deck[i+1];
	}
	player.deckCount--;
	scr_decide_deck_change(player);
}
