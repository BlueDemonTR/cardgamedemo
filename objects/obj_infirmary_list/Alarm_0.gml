if(self.player.open_game_state && self.player.main_phase){
	var position = self.position,
	player = self.player,
	i = 0;
	if(scr_legal_activation(cardNum, scr_ignition_effect_number(cardNum, "Infirmary"), position)){
		with(instance_create_depth(x,y,depth-1,obj_activation_box)){
			activation_mode = FunctionInfirmaryEffect;
			self.position = position;
			self.player = player;
			bar_number = i;
			y -= (bar_number * 40);
		}
		i++
	}
}