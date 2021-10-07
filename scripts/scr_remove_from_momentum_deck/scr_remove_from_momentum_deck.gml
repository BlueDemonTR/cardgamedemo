function scr_remove_from_momentum_deck(player, momentumDeckPos) {
	with(player){
		for (var i = player; i < momentumDeckCount; i++){
			momentum_deck[i] = momentum_deck[i+1];
		}
		momentumDeckCount--;
	}
	scr_decide_momentum_deck(player);
}
