function scr_spin(player, position) {
	var cardNum = player.field[position, 0],
	artNum = player.field[position,1];
	
	if(macros.card_type[cardNum] != TypeMomentum){
		player.deck[player.deckCount++] = [cardNum, artNum];
		
		scr_shuffle_deck(player);
	}else{
		player.momentumDeck[player.momentumDeckCount++] = [cardNum, artNum];
		scr_decide_momentum_deck(player);
	}
	
	with(player.fieldCard[position]){
		instance_destroy();
	}
	scr_decide_field(player, position, 0, 0, "spin")

}
