function scr_message_stats() {
	if (!instance_exists(obj_client)){return;}
	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_STATS);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.playerHP);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.mana);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.momentum);
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));
/* end scr_message_stats */
}
