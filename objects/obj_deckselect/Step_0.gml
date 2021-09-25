if(mouse_check_button_released(mb_left) && list_open){
	if(mouse_x > x && mouse_x < x+sprite_width && mouse_y > y && mouse_y < y+(selectorCap*22)){
		macros.selectedDeck = fileList[int64((mouse_y-y)/22)];
		list_open = false;
		if(room=room_deck_builder){
			obj_deck_builder.alarm[1] = 2		
		}
	}
}
