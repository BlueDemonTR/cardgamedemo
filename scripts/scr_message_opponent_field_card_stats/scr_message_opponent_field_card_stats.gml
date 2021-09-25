function scr_message_opponent_field_card_stats(argument0) {
	if (!instance_exists(obj_client)){return;}
	
	var field_location = argument0;
	if (obj_opponent.fieldCard[field_location] == noone){return;}
	//hp_change = obj_opponent.fieldCard[field_location].cardHP,
	//max_hp_change = obj_opponent.fieldCard[field_location].cardmaxHP,
	//atk_change =obj_opponent.fieldCard[field_location].cardatk,
	//level_change =obj_opponent.fieldCard[field_location].cardlevel;

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_OPPONENT_FIELD_CARD_STATS);
	buffer_write(obj_client.send_buffer, buffer_u8, field_location);

	buffer_write(obj_client.send_buffer, buffer_u8, macros.stat_count);
	for(var i = 0; i < macros.stat_count; i++){
		if(array_length(obj_player.fieldCard[field_location].cardStat) > i){
			buffer_write(obj_client.send_buffer, buffer_s16, obj_opponent.fieldCard[field_location].cardStat[i]);
		}else{
			buffer_write(obj_client.send_buffer, buffer_s16, 0);
		}
	}
	buffer_write(obj_client.send_buffer, buffer_u8, macros.status_count);
	for(var i = 0; i < macros.status_count; i++){
		if(variable_array_exists(macros.origStatus,cardNum,i)){
			buffer_write(obj_client.send_buffer, buffer_bool, obj_opponent.fieldCard[field_location].cardStatus[i]);
		}else{
			buffer_write(obj_client.send_buffer, buffer_bool, false);
		}
	}
	
	//buffer_write(obj_client.send_buffer, buffer_u8, obj_opponent.fieldCard[field_location].cardSharedEffectsCount);
	//for(var i = 0; i <obj_opponent.fieldCard[field_location].cardSharedEffectsCount; i++){
	//		buffer_write(obj_client.send_buffer, buffer_u16, obj_opponent.fieldCard[field_location].cardSharedEffects[i]);
	//}
	
	//buffer_write(obj_client.send_buffer, buffer_u8, obj_opponent.fieldCard[field_location].cardArchetypeCount);
	//for(var i = 0; i < obj_opponent.fieldCard[field_location].cardArchetypeCount; i++){
	//		buffer_write(obj_client.send_buffer, buffer_u16, obj_opponent.fieldCard[field_location].cardArchetype[i]);
	//}
	
	
	buffer_write(obj_client.send_buffer, buffer_bool, obj_opponent.fieldCard[field_location].cardcan_attack);
	
	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));


}
