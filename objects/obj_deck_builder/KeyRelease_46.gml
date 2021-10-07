if(alarm[0] == -1){alarm[0] = 90}
else{
	deckCount=0;
	momentumDeckCount=0;

	for(i = 0; i < 60; i++){
		deck[i, CardNumber] = 0;
		deck[i, ArtNumber] = 0;
	}
	for(i = 0; i < 7; i++){
		momentumDeck[i, CardNumber] = 0;
		momentumDeck[i, ArtNumber] = 0;
	}
	scr_count_types_in_deck()
}