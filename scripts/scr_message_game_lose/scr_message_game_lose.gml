function scr_message_game_lose() {
	if (!instance_exists(obj_client)){return;}

	obj_player.own_turn = false
	obj_player.victory_state = -1
	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_WIN);
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));


}
