function scr_find_turn(argument0) {
	var socket_id = argument0;

	for(i=0; i < 50; i++){
		if(match_array[i, 0] == socket_id){
			return 0;
		}
		if(match_array[i, 1] == socket_id){
			return 1;
		}
	}


}
