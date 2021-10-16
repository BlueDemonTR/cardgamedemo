function scr_find_opponent(argument0) {
	var socket_id = argument0;

	for(i=0; i < 50; i++){
		if(match_array[i, 0] == socket_id){
			return match_array[i,1];
		}
		if(match_array[i, 1] == socket_id){
			return match_array[i,0];
		}
	}


}
