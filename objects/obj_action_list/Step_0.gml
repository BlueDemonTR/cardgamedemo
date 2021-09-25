if(mouse_check_button_released(mb_left) && mouse_x > x-+sprite_width && mouse_x < x && mouse_y > originY && mouse_y < originY + sprite_height){
	if(open_list){
		open_list=false;
		y = originY
	}
	else if(!open_list){
		open_list=true;
	}
}