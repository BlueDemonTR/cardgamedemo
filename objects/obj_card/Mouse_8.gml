if (x > 435 && x < 1460){
	if (y > 855 && y < 1060){
		var position= self.position
		if(!obj_player.mid_effect &&scr_hand_effect(self.cardNum)){
			with(instance_create_depth(x,y,depth-1,obj_activation_box)){
				activation_mode = FunctionHandEffect;
				self.position = position;
			}
		}
	}
}

//DEBUG
card_in_hand = false