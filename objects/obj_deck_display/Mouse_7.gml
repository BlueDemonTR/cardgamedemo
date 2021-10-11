if(macros.card_type[cardNum] != TypeMomentum){

	for (var i = deckPos; i < main.deckCount-1; i++){
		main.deck[i] = main.deck[i+1];
	}
	main.deckCount--;
}else{
	for (i = momentumDeckPos; i < main.momentumDeckCount-1; i++){
		main.momentumDeck[i] = main.momentumDeck[i+1];
	}
	main.momentumDeckCount--;
}