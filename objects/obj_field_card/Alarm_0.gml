if(self.player.open_game_state && self.player.main_phase){
	var position = self.position,
	player = self.player,
	barPosition = 0,
	ownerObject = self;
	
	if(
		scr_legal_activation(
			cardNum, scr_ignition_effect_number(cardNum, "Field"), 
			player, position
		)
	){
		
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionFieldEffect;
			self.position = position;
			self.player = player;
			opponent = player.opponent;
			bar_number = barPosition;
			y += ((bar_number - 1)*40);
			self.ownerObject = ownerObject;
		}
		barPosition++
	}
	
	if(
		attacksLeft 
		&& !getStatus(StatusUnarmed) 
		&& !getStatus(StatusParalyzed)
		&& player.turn_count != 1 
		&& array_length(scr_count_attack(self))
	){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionAttack;
			self.position = position;
			self.player = player;
			opponent = player.opponent;
			bar_number = barPosition;
			y += ((bar_number - 1)*40)
			self.ownerObject = ownerObject;
		}
		barPosition++
	}
	
	if(sacrificable){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionSacrifice;
			self.position = position;
			self.player = player;
			opponent = player.opponent;
			bar_number = barPosition;
			y += ((bar_number - 1)*40);
			self.ownerObject = ownerObject;
		}
		barPosition++
	}
}