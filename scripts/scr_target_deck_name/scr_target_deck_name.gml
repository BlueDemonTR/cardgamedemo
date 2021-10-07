function scr_search_name(player, cardNum) {
	//Finds any specific cardNum in the deck and returns it's position
	with(player){
		for (var i = 0; i < deckCount; i++){
			if (deck[i, CardNumber] == cardNum){
				return i;
			}
		}
	}
}
