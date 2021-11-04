if(mouse_between(x - small_card_width/2, y - small_card_height/2, x + small_card_width/2,y + small_card_height/2)){
	scr_change_displayed_card(cardNum, artNum, false)
	if(mouse_check_button_released(mb_right)){
		if(artNum+1 = macros.sprite_count[cardNum]){
			artNum = 0;
		}else{
			artNum++;
		}
	}
}