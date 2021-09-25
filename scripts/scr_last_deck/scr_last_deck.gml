function scr_last_deck() {
	ini_open(macros.selectedDeck)
	deckCount = ini_read_real("deckSizes", "mainDeck",1);
	momentumDeckCount = ini_read_real("deckSizes", "momentumDeck",1);
	for(var i = 0; i < deckCount; i++){
		deck[i] = ini_read_real("deck", string(i), 1);
	}
	for(var i = 0; i < momentumDeckCount; i++){
		momentum_deck[i] = ini_read_real("momentumDeck", string(i), 2);
	}
	selected_wheel = ini_read_real("Chosen Wheel", "Wheel Number", 1);
	ini_close();


}
