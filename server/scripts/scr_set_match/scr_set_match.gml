function scr_set_match(argument0) {
	var socket_id = argument0;
	show_debug_message(socket_id);
	for(i = 0; i < 50; i++){
		if(match_array[i,0] != -1 && match_array[i,1] == -1 && !match_array[i,2]){
			match_array[i,1] = socket_id;
			return;
		}
	}
	for(i = 0; i < 50; i++){
		if(match_array[i,0] == -1 && match_array[i,1] == -1 && !match_array[i,2]){
			match_array[i,0] = socket_id;
			show_debug_message(socket_id);
			return;
		}
	}




}
