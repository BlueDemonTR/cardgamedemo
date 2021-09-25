if (x > 435 && x < 1460){
	if (y > 855 && y < 1060){
		var hand_position= self.hand_position
		if(!obj_player.mid_effect &&scr_hand_effect(self.cardNum)){
			activation[0] = instance_create_depth(x,y,depth-1,obj_activation_box);
			with(activation[0]){
				activation_mode="Hand Effect";
				origin_card_location=hand_position;
			}
		}
	}
}