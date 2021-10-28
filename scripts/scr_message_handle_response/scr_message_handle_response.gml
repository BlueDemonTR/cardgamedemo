function scr_message_handle_response(arrayPos){
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_HANDLE_RESPONSE);
	
	buffer_write(obj_client.send_buffer, buffer_u8, arrayPos);
	
	var sendArray = [];
	for(var i = 1; i < argument_count; i++){
		array_push(sendArray, argument[i])
	}
	
	buffer_write(obj_client.send_buffer, buffer_string, json_stringify(sendArray));

	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));
}