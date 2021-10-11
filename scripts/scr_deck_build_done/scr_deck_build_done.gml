function scr_deck_build_done(deckName) {
	var file = file_text_open_write(deckName);
	file_text_write_real(file,main.deckCount);
	for(i = 0; i < main.deckCount; i++){
		file_text_writeln(file);
		file_text_write_real(file,main.deck[i, 0]);
		file_text_writeln(file);
		file_text_write_real(file,main.deck[i, 1]);
	}
	
	file_text_writeln(file);
	file_text_writeln(file);
	
	file_text_write_real(file,main.momentumDeckCount);
	for(i = 0; i < main.momentumDeckCount;i++){
		file_text_writeln(file);
		file_text_write_real(file,main.momentumDeck[i, 0])
		file_text_writeln(file);
		file_text_write_real(file,main.momentumDeck[i, 1])
	}
	
	file_text_writeln(file);
	file_text_writeln(file);
		
	file_text_write_real(file,obj_select_wheel.chosen_wheel);
	file_text_close(file);
	room_goto(room_main_menu);
	return;




}
