if(activation_mode == FunctionHandEffect){
	x = obj_player.handCard[position].x
	y = obj_player.handCard[position].y
	if (obj_player.handCard[position].selected || !(mouse_between(x-card_width/2, mouse_x < x+card_width/2, mouse_y > y-card_height/2, y+card_height/2))){
		with(obj_activation_box){
			if(activation_mode != FunctionChoices){
				instance_destroy();
			}
		}
	}
}
