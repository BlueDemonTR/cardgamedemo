function scr_remove_from_momentum_deck(player, momentumDeckPos) {
	with(player){
		for (var i = player; i < momentumDeckCount; i++){
			momentumDeck[i] = momentumDeck[i+1];
		}
		momentumDeckCount--;
	}
	scr_decide_momentum_deck(player);
}
