if(macros.card_type[cardNum] != TypeMomentum){

	for (var i = deckPos; i < main.deckCount-1; i++){
		main.deckList[i].cardNum = main.deckList[i+1].cardNum;
		main.deckList[i].artNum = main.deckList[i+1].artNum;
		main.deck[i,0] = main.deck[i+1,0];
		main.deck[i,1] = main.deck[i+1,1];
	}
	with(main.deckList[main.deckCount-1]){
		instance_destroy()
	}
	main.deckCount--;
	scr_organize_deck_list()
}else{
	for (i = momentumDeckPos; i < main.momentumDeckCount-1; i++){
		main.momentumDeckList[i].cardNum = main.momentumDeckList[i+1].cardNum;
		main.momentumDeckList[i].artNum = main.momentumDeckList[i+1].artNum;
		main.momentumDeck[i,0] = main.momentumDeck[i+1,0];	
		main.momentumDeck[i,1] = main.momentumDeck[i+1,1];	
	}
	with(main.momentumDeckList[main.momentumDeckCount-1]){
		instance_destroy()
	}
	main.momentumDeckCount--;
}