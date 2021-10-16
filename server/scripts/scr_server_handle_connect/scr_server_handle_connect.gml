function scr_server_handle_connect(argument0) {
	var socket_id = argument0

	if(match_count == 50){
		return;
	}
	ini_open(fileName);
		ini_write_string("Logs",string(scr_get_full_date()),"Client logged with "+string(socket_id))
	ini_close();
	scr_set_match(socket_id);


}
