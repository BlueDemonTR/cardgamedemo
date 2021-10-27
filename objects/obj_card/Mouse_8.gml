if (x > 435 && x < 1460){
	if (y > 855 && y < 1060){
		var position = self.position,
		ownerObject = self;
		if(obj_player.open_game_state && scr_hand_effect(self.cardNum)){
			with(instance_create_depth(x,y,depth-1,obj_activation_box)){
				activation_mode = FunctionHandEffect;
				self.position = position;
				self.ownerObject = ownerObject;
			}
		}
	}
}