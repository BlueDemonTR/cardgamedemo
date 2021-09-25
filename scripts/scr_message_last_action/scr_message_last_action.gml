function scr_message_last_action(argument0) {
	if (!instance_exists(obj_client)){return;}
	var message = argument0;
	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_LAST_ACTION);
	buffer_write(obj_client.send_buffer, buffer_string, message);
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));


}
