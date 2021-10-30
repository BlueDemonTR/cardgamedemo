function scr_opponent_get_object(argument0) {
	var client_id = argument0;
	if (instance_exists(obj_opponent)){
	//if (ds_map_exists(clientmap,string(client_id))){
		//if obj_opponent exists
		//return clientmap[? string(client_id)];
		return obj_opponent;
	}else{
		//opponent does not exist
		var l = instance_create_layer(room_width/2,room_height/2, "Instances", obj_opponent);
		//clientmap[? string(client_id)] = l
		return l;
	}
}

//This code is normally for handling 3+ player games, I do not and honestly will not do a gamemode that works with more than 2 players since
//not only is my codebase not made for something like that, my card design isn't too. This function doesn't really do anything but make the game
//create a second opponent the moment the server does a slight hiccup. If someone wants to waste time fixing/finding all the hiccups, go for it
//but I really won't deal with it. I've had enough.