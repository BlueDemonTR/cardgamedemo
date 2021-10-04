
scr_initialize_momentum_wheel();
scr_illegal_cards();

main = obj_deck_builder
filterText = ""
searchedText = ""
scr_filter_words(filterText)
maxLineCount = 0
maxLineSize = 0
for(var i = 0; i < 5; i++){
	cardList[i] = instance_create_depth(room_width-220,305+(small_card_height+10)*i,-1,obj_card_selector);
	with(cardList[i]){
		listNum = i
		listPos = i
		cardNum = main.filtered_cards[listPos]
		artNum = 0
		sprite_index = macros.sprite_array[cardNum,0]
	}
}
selectorCount = i;

deckCount=0;
monsterCount=0;
spellCount=0;
momentumDeckCount=0;

for(i = 0; i < 61; i++){
	deck[i,0] = 0;
	deck[i,1] = 0;
}
for(i = 0; i < 8; i++){
	momentumDeck[i,0] = 0;
	momentumDeck[i,1] = 0;
}
alarm[1] = 2
//if(file_exists(macros.selectedDeck)){
//	var file = file_text_open_read(macros.selectedDeck)
//	deckCount = file_text_read_real(file);
//	file_text_readln(file);
//	for(i=0; i < min(deckCount, 60); i++){
//		//deckList[i] = instance_create_depth(475, 250,-i, obj_deck_display);
//		deck[i,0] = file_text_read_real(file);
//		file_text_readln(file);
//		deck[i,1] = file_text_read_real(file);
//		file_text_readln(file);
//		//with(deckList[i]){
//		//	deckPos= i;
//		//	cardNum = main.deck[i,0]
//		//	artNum = main.deck[i,1]
//		//}			
//	}
//	momentumDeckCount = file_text_read_real(file);
//	file_text_readln(file);
//	for(i=0; i < min(momentumDeckCount, 60); i++){
//		//momentumDeckList[i] =  instance_create_depth(475+(small_card_width)*(i), 930,-i, obj_deck_display);
//		momentumDeck[i,0] = file_text_read_real(file);
//		file_text_readln(file);
//		momentumDeck[i,1] = file_text_read_real(file);
//		file_text_readln(file);
//		//with(momentumDeckList[i]){
//		//	momentumDeckPos= i;
//		//	cardNum = main.momentumDeck[i,0];
//		//	artNum = main.momentumDeck[i,1];

//		//}			
//	}
//	file_text_readln(file);
	
//	obj_select_wheel.chosen_wheel = file_text_read_real(file)
//	file_text_close(file)
//	//scr_organize_deck_list()

//}




//if(file_exists(macros.selectedDeck)){
//	ini_open(macros.selectedDeck)
//	if(ini_read_real("deckSizes","mainDeck", 0) < 60 && ini_read_real("deckSizes","momentumDeck", 0) < 7 && ini_section_exists("deck") && ini_read_real("Chosen Wheel", "Wheel Number",0) < macros.total_wheels && ini_section_exists(("momentumDeck"))){
//		deckCount= ini_read_real("deckSizes","mainDeck", 0)
//		momentumDeckCount= ini_read_real("deckSizes","momentumDeck", 0)
//		for(var i = 0; i < deckCount; i++){
//			deckList[i] = instance_create_depth(475, 250,-i, obj_deck_display);
//			deck[i] = ini_read_real("deck",string(i),0)
//			with(deckList[i]){
//				deckPos= i;
//				cardNum = main.deck[deckPos];
//			}
			
//		}
//		for(var i = 0; i < momentumDeckCount; i++){
//			momentumDeckList[i] = instance_create_depth(475+(small_card_width)*(i), 930,-i, obj_deck_display);
//			momentumDeck[i] = ini_read_real("momentumDeck",string(i),0)
//			with(momentumDeckList[i]){
//				momentumDeckPos = i
//				cardNum = main.momentumDeck[momentumDeckPos];
//			}
//		}
//		obj_select_wheel.chosen_wheel = ini_read_real("Chosen Wheel", "Wheel Number",0)
//		scr_organize_deck_list()
//	}

//	ini_close()
//}





