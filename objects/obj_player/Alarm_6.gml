if(instance_exists(obj_client)){
	network_destroy(obj_client.socket);
}
instance_destroy(obj_client);
room_goto(room_main_menu);
