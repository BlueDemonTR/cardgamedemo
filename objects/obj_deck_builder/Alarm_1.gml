if(file_exists(macros.selectedDeck)){
	var file = file_text_open_read(macros.selectedDeck)
	deckCount = file_text_read_real(file);
	file_text_readln(file);
	for(i=0; i < min(deckCount, 60); i++){
		deck[i,0] = file_text_read_real(file);
		file_text_readln(file);
		deck[i,1] = file_text_read_real(file);
		file_text_readln(file);		
	}
	momentumDeckCount = file_text_read_real(file);
	file_text_readln(file);
	for(i=0; i < min(momentumDeckCount, 60); i++){
		momentumDeck[i,0] = file_text_read_real(file);
		file_text_readln(file);
		momentumDeck[i,1] = file_text_read_real(file);
		file_text_readln(file);		
	}
	file_text_readln(file);
	
	obj_select_wheel.chosen_wheel = file_text_read_real(file)
	file_text_close(file)
}
scr_count_types_in_deck()