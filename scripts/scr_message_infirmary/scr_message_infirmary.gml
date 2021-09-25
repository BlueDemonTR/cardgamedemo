function scr_message_infirmary() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_INFIRMARY);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.infirmaryCount);
	for(var i = 0; i < obj_player.infirmaryCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_player.infirmary[i,0]);
		buffer_write(obj_client.send_buffer, buffer_u8, obj_player.infirmary[i,1]);
		buffer_write(obj_client.send_buffer, buffer_u8, obj_player.infirmary[i,2]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));
}
