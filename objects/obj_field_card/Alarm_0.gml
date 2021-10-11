if(player.open_game_state && player.main_phase){
	var position = self.position,
	player = self.player,
	i=0;
	if(attacksLeft && !cardStatus[StatusUnarmed] && !cardStatus[StatusParalyzed] && player.turn_count != 1 && scr_count_attack(self) != []){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = "Attack";
			self.position = position;
			self.player = player;
			bar_number = i;
			y -= (bar_number * 40)
		}
		i++
	}
	if(scr_legal_activation(cardNum, scr_ignition_effect_number(cardNum, "Field"), position)){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = "Effect";
			self.position = position;
			self.player = player;
			bar_number = i;
			y -= (bar_number * 40);
		}
		i++
	}
	if(sacrificable){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = "Sacrifice";
			self.position = position;
			self.player = player;
			bar_number = i;
			y += (bar_number * 40);
		}
		i++
	}
}