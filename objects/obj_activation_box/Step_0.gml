if(activation_mode == "Hand Effect"){
	x=obj_player.handCard[origin_card_location].x
	y=obj_player.handCard[origin_card_location].y
	if (obj_player.handCard[origin_card_location].selected || !(mouse_x < x+card_width/2 && mouse_x > x-card_width/2 && mouse_y < y+card_height/2 && mouse_y > y-card_height/2)){
		with(obj_activation_box){
			if(activation_mode != "Multiple Choices"){
				instance_destroy();
			}
		}
	}
}
