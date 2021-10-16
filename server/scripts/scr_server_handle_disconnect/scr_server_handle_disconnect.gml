function scr_server_handle_disconnect(argument0) {
	var socket_id = argument0;
	var temp2 = scr_find_opponent(socket_id);
	ini_open(fileName);
		ini_write_string("Logs",string(scr_get_full_date()),"Client "+string(socket_id)+" disconnected")
	ini_close();
		buffer_seek(send_buffer, buffer_seek_start, 0);
		buffer_write(send_buffer, buffer_u8, MESSAGE_LEAVE);
		buffer_write(send_buffer, buffer_u16, socket_id);	
		network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
	for(i = 0; i < 50; i++){
		if(match_array[i, 0] == socket_id){
			match_array[i, 0] = -1;
			match_array[i, 2] = true;	
		}
		else if(match_array[i, 1] == socket_id){
			match_array[i, 1] = -1;
			match_array[i, 2] = true;	
		}	
	}



}
