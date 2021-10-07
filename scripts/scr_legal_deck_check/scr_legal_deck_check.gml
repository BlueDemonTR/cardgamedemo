function scr_legal_deck_check(argument0) {
	var checkedDeck = argument0,
	cardCounter = noone;
	if(!file_exists(checkedDeck)){
		show_debug_message("Deck Not Found")
		return false;
	}
	var file = file_text_open_read(checkedDeck),
	deck,
	deckCount,
	momentumDeck,
	momentumDeckCount,
	selected_wheel;
	
	cardCounter[macros.total_cards] = 0;
	
	deckCount = file_text_read_real(file);
	file_text_readln(file);
	if (40 > deckCount || deckCount > 60){
		show_debug_message("Deck Too Small or too big")
		return false;
	}
	for(var i=0; i < deckCount; i++){
		deck[i, CardNumber] = file_text_read_real(file);
		if (deck[i, CardNumber] >= macros.total_cards || macros.card_type[deck[i, CardNumber]] == TypeMomentum){
			show_debug_message("cardNum "+string(deck[i, CardNumber])+" invalid or is not made for the main deck")
			return false;
		}
		cardCounter[deck[i, CardNumber]]++
		file_text_readln(file);
		deck[i, ArtNumber] = file_text_read_real(file);
		if (deck[i, ArtNumber] >= macros.sprite_count[deck[i, CardNumber]]){
			show_debug_message("Sprite number "+string(deck[i, ArtNumber])+" for "+ string(deck[i, CardNumber])+" is invalid")
			return false;
		}
		file_text_readln(file);		
	}
	momentumDeckCount = file_text_read_real(file);
	if (7 < momentumDeckCount){
		show_debug_message("Momentum Deck Too Big")
		return false;
	}
	file_text_readln(file);
	for(i=0; i < min(momentumDeckCount, 60); i++){
		momentumDeck[i, CardNumber] = file_text_read_real(file);
		if (momentumDeck[i, CardNumber] >= macros.total_cards || macros.card_type[momentumDeck[i, CardNumber]] != TypeMomentum){
			show_debug_message("cardNum "+string(momentumDeck[i, CardNumber])+" invalid or is not made for the momentum deck")
			return false;
		}
		cardCounter[momentumDeck[i, CardNumber]]++		
		file_text_readln(file);
		momentumDeck[i, ArtNumber] = file_text_read_real(file);
		if (momentumDeck[i, ArtNumber] >= macros.sprite_count[momentumDeck[i, CardNumber]]){
			show_debug_message("Sprite number "+string(momentumDeck[i, ArtNumber])+" for "+ string(momentumDeck[i, CardNumber])+" is invalid")
			return false;
		}		
		file_text_readln(file);		
	}
	file_text_readln(file);
	
	selected_wheel = file_text_read_real(file)
	if (selected_wheel >= macros.total_wheels){
		show_debug_message("Invalid Wheel")
		return false
	}
	
	for(i = 0; i < array_length(cardCounter); i++){
		if(cardCounter[i] > 3){
			show_debug_message("Too many copies of "+macros.name[cardCounter[i]])
			return false;
		}
	}

	file_text_close(file)
	return true;



}
