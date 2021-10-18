function scr_message_opponent_field_card_stats(position) {
	if(!instance_exists(obj_client)){return;}
	if(!instance_exists(obj_opponent.fieldCard[position])){return}
	
	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_OPPONENT_FIELD_CARD_STATS);
	buffer_write(obj_client.send_buffer, buffer_u8, position);

	buffer_write(obj_client.send_buffer, buffer_u8, macros.stat_count);
	for(var i = 0; i < macros.stat_count; i++){
		if(array_length(obj_player.fieldCard[position].cardStat) > i){
			buffer_write(obj_client.send_buffer, buffer_s16, obj_opponent.fieldCard[position].cardStat[i]);
		}else{
			buffer_write(obj_client.send_buffer, buffer_s16, 0);
		}
	}
	buffer_write(obj_client.send_buffer, buffer_u8, macros.status_count);
	for(var i = 0; i < macros.status_count; i++){
		if(variable_array_exists(macros.origStatus,cardNum,i)){
			buffer_write(obj_client.send_buffer, buffer_bool, obj_opponent.fieldCard[position].cardStatus[i]);
		}else{
			buffer_write(obj_client.send_buffer, buffer_bool, false);
		}
	}
	buffer_write(obj_client.send_buffer, buffer_bool, obj_opponent.fieldCard[position].attacksLeft);
	
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));


}
