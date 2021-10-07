var temp1 = scr_mouse_deck_position(mouse_x,mouse_y)
if(temp1 = -1){
	return
}else if(temp1 >= 100){
	temp1 -= 100
	if (temp1 > momentumDeckCount-1){return}
	if(mouse_check_button_released(mb_left) && !obj_deckselect.list_open){
		for (var i = temp1; i < momentumDeckCount-1; i++){
			momentumDeck[i] = momentumDeck[i+1];
		}
		scr_count_types_in_deck()
		momentumDeckCount--;
	}	
	obj_card_info_writer.selected_card = momentumDeck[temp1]
}else if(temp1 < 60){
	if (temp1 > deckCount-1){return}
	if(mouse_check_button_released(mb_left) && !obj_deckselect.list_open){
		for (var i = temp1; i < deckCount-1; i++){
			deck[i] = deck[i+1];
		}
		scr_count_types_in_deck()
		deckCount--;
	}
	
	obj_card_info_writer.selected_card = deck[temp1]
}
