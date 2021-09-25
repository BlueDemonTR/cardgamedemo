if (keyboard_check_released(vk_escape) && test_mode){
		if(instance_exists(obj_client)){network_destroy(obj_client.socket)}
		game_restart();
}