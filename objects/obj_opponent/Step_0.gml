if(mouse_check_button_released(mb_left) && mouse_between(infirmary_x-card_width/2, infirmary_x+card_width/2, infirmary_y-card_height/2, infirmary_y+card_height/2)){
	if(!obj_infirmary.infirmaryListOpened && infirmaryCount > 0){alarm [0] = 1;}
	else if(obj_infirmary.infirmaryListOpened){alarm [1]=1;}
}