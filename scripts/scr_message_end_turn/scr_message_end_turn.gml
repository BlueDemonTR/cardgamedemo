function scr_message_end_turn() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_END_TURN);
	obj_player.turn_count++;
	obj_player.end_phase = false;
	obj_player.own_turn = false;
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));



}
