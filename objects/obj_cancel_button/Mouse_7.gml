if(instance_exists(obj_appropiate_targets)){
	if(obj_appropiate_targets.current_function="Attack" || obj_appropiate_targets.current_function="DirectAttack"){
		player.open_game_state = true
		with(obj_appropiate_targets){
			instance_destroy()
		}
	}
}