function scr_last_action(argument0) {
	var message = argument0;
	with(obj_action_list){
		last_action++;
		action_list[last_action] = message;
	}


}
