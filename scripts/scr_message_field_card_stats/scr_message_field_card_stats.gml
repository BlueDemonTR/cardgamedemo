function scr_message_field_card_stats(position) {
	if (!instance_exists(obj_client)){return;}
	if (!obj_player.field[position,0]){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_FIELD_CARD_STATS);
	buffer_write(obj_client.send_buffer, buffer_u8, position);
	
	buffer_write(obj_client.send_buffer, buffer_u8, macros.stat_count);
	for(var i = 0; i < macros.stat_count; i++){
		buffer_write(obj_client.send_buffer, buffer_u16, obj_player.fieldCard[position].getStat(i));
	}
	
	buffer_write(obj_client.send_buffer, buffer_u8, macros.status_count);
	for(var i = 0; i < macros.status_count; i++){
		buffer_write(obj_client.send_buffer, buffer_bool, obj_player.fieldCard[position].getStatus(i));
	}
	buffer_write(obj_client.send_buffer, buffer_u8, obj_player.fieldCard[position].attacksLeft);
	
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));
}
