if(instance_exists(obj_appropiate_targets)){
	if(obj_appropiate_targets.current_function="attack" || obj_appropiate_targets.current_function="direct_attack"){
		with(obj_appropiate_targets){
			instance_destroy()
		}
	}
}