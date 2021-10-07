function scr_construct_global_deck() {
	if(file_exists(macros.selectedDeck)){
		var file = file_text_open_read(macros.selectedDeck)
		deckCount = file_text_read_real(file);
		file_text_readln(file);
		for(i=0; i < min(deckCount, 60); i++){
			deck[i, CardNumber] = file_text_read_real(file);
			file_text_readln(file);
			deck[i, ArtNumber] = file_text_read_real(file);
			file_text_readln(file);		
		}
		momentumDeckCount = file_text_read_real(file);
		file_text_readln(file);
		for(i = 0; i < min(momentumDeckCount, 60); i++){
			momentumDeck[i, CardNumber] = file_text_read_real(file);
			file_text_readln(file);
			momentumDeck[i, ArtNumber] = file_text_read_real(file);
			file_text_readln(file);		
		}
		file_text_readln(file);
	
		selected_wheel = file_text_read_real(file)
		file_text_close(file)
	}
}
