function scr_message_opponent_infirmary() {
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_OPPONENT_INFIRMARY);
	buffer_write(obj_client.send_buffer, buffer_u8, obj_opponent.infirmaryCount);
	for(var i = 0; i < obj_opponent.infirmaryCount; i++){
		buffer_write(obj_client.send_buffer, buffer_u32, obj_opponent.infirmary[i,0]);
		buffer_write(obj_client.send_buffer, buffer_u32, obj_opponent.infirmary[i,1]);
	}
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));

}
