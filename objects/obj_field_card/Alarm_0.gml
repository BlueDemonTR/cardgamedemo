if(self.player.open_game_state && self.player.main_phase){
	var position = self.position,
	player = self.player,
	i=0,
	ownerObject = self;
	if(attacksLeft && !getStatus(StatusUnarmed) && !getStatus(StatusParalyzed)	&& player.turn_count != 1 && array_length(scr_count_attack(self))){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionAttack;
			self.position = position;
			self.player = player;
			opponent = player.opponent;
			bar_number = i;
			y -= (bar_number * 40)
			self.ownerObject = ownerObject;
		}
		i++
	}
	if(scr_legal_activation(cardNum, scr_ignition_effect_number(cardNum, "Field"), player, position)){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionFieldEffect;
			self.position = position;
			self.player = player;
			opponent = player.opponent;
			bar_number = i;
			y -= (bar_number * 40);
			self.ownerObject = ownerObject;
		}
		i++
	}
	if(sacrificable){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionSacrifice;
			self.position = position;
			self.player = player;
			opponent = player.opponent;
			bar_number = i;
			y += (bar_number * 40);
			self.ownerObject = ownerObject;
		}
		i++
	}
}