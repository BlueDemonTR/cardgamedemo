function scr_opponent_get_object(argument0) {
	var client_id = argument0;
	if (ds_map_exists(clientmap,string(client_id))){
		//if obj_opponent exists
		return clientmap[? string(client_id)];
	}else{
		//opponent does not exist
		var l = instance_create_layer(room_width/2,room_height/2, "Instances", obj_opponent);
		clientmap[? string(client_id)] = l
		return l;
	}


}
