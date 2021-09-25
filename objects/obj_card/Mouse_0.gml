if(instance_exists(obj_activation_box)){
	if (!(mouse_x > x-card_width/2 && mouse_x < x+card_width/2)){
		if (!(mouse_y > y-25 && mouse_y < y+25)){
			selected=true;
		}
	}
}else{
	if(mouse_check_button_pressed(mb_left) && x == card_x && y = card_y ){
	selected = true;
	}
}

