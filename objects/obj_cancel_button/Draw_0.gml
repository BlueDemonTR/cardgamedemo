if(instance_exists(obj_appropiate_targets)){
	if(
		obj_appropiate_targets.current_function == TargetAttack 
		|| obj_appropiate_targets.current_function == TargetDirect
	){
		draw_self()
	}
}