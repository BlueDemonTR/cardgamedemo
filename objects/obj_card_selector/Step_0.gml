if(mouse_between(x - small_card_width/2, x + small_card_width/2, y - small_card_height/2, y + small_card_height/2))
	obj_card_info_writer.selected_card[0] = cardNum
	obj_card_info_writer.selected_card[1] = artNum
	if(mouse_check_button_released(mb_right)){
		if(artNum+1 = macros.sprite_count[cardNum]){
			artNum = 0;
		}else{
			artNum++;
		}
	}
}