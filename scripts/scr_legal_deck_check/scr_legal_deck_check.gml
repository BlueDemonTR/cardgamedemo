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
		deck[i,0] = file_text_read_real(file);
		if (deck[i,0] >= macros.total_cards || macros.card_type[deck[i,0]] == 1){
			show_debug_message("cardNum "+string(deck[i,0])+" invalid or is not made for the main deck")
			return false;
		}
		cardCounter[deck[i,0]]++
		file_text_readln(file);
		deck[i,1] = file_text_read_real(file);
		if (deck[i,1] >= macros.sprite_count[deck[i,0]]){
			show_debug_message("Sprite number "+string(deck[i,1])+" for "+ string(deck[i,0])+" is invalid")
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
		momentumDeck[i,0] = file_text_read_real(file);
		if (momentumDeck[i,0] >= macros.total_cards || macros.card_type[momentumDeck[i,0]] != 1){
			show_debug_message("cardNum "+string(momentumDeck[i,0])+" invalid or is not made for the momentum deck")
			return false;
		}
		cardCounter[momentumDeck[i,0]]++		
		file_text_readln(file);
		momentumDeck[i,1] = file_text_read_real(file);
		if (momentumDeck[i,1] >= macros.sprite_count[momentumDeck[i,0]]){
			show_debug_message("Sprite number "+string(momentumDeck[i,1])+" for "+ string(momentumDeck[i,0])+" is invalid")
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
