if(mouse_check_button_released(mb_left) && list_open){
	if(mouse_between(x, y, x + sprite_width, y + selectorCap*22)){
		macros.selectedDeck = fileList[int64((mouse_y-y)/22)];
		list_open = false;
		if(room=room_deck_builder){
			obj_deck_builder.alarm[1] = 2		
		}
	}
}
