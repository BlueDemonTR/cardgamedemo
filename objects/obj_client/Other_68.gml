switch(async_load[? "type"]){
	case network_type_data:
		scr_client_handle_message(async_load[? "buffer"]);
	break;
}