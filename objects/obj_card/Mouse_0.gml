if(instance_exists(obj_activation_box)){
	if(!mouse_between(x - card_width/2, y - 25, x + card_width/2, y+25)){
		selected = true;
	}
}else{
	if(mouse_check_button_pressed(mb_left) && x == card_x && y = card_y){
		with(obj_card){
			if(selected){
				return;
			}
		}
		selected = true;
	}
}

