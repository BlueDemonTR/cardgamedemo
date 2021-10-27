var position = self.position
instance_exists(obj_activation_box){
	with(obj_activation_box){
		if(activation_mode == FunctionInfirmaryEffect && position = self.position){
			return;
		}
	}
}
alarm[0] = 3