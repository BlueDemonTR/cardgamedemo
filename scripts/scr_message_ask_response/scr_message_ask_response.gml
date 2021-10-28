function scr_message_ask_response(RESPONSE_ID){
	if (!instance_exists(obj_client)){return;}

	buffer_seek(obj_client.send_buffer, buffer_seek_start, 0);
	buffer_write(obj_client.send_buffer, buffer_u8, MESSAGE_ASK_RESPONSE);
	
	buffer_write(obj_client.send_buffer, buffer_u8, RESPONSE_ID);
	switch(RESPONSE_ID){
		case RESPONSE_CHOOSE_FIELD_ZONE:
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_opponent))//Can choose own
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_player))//Can choose opponent
			buffer_write(obj_client.send_buffer, buffer_bool, argument[2])//Select Filled
			buffer_write(obj_client.send_buffer, buffer_bool, argument[3])//Select NMZ
			buffer_write(obj_client.send_buffer, buffer_bool, argument[4])//Select MMZ
			buffer_write(obj_client.send_buffer, buffer_u8, argument[5])//arrayPos
		break;
		
		case RESPONSE_TARGET_DECK:
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_opponent))//Can choose own
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_player))//Can choose opponent		
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[2]))//Type Array
			buffer_write(obj_client.send_buffer, buffer_u8, argument[3])//Min Level
			buffer_write(obj_client.send_buffer, buffer_u8, argument[4])//Max Level
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[5]))//Archetype Array
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[6]))//Spirit Array
			buffer_write(obj_client.send_buffer, buffer_bool, argument[7])//Check Summonable
			buffer_write(obj_client.send_buffer, buffer_s8, argument[8])//Filter Number
			buffer_write(obj_client.send_buffer, buffer_u8, argument[9])//arrayPos
		break;
		
		case RESPONSE_TARGET_FIELD:
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_opponent))//Can choose own
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_player))//Can choose opponent		
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[2]))//Type Array
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[3]))//Level
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[4]))//ATK
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[5]))//HP
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[6]))//Archetype Array
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[7]))//Spirit Array
			buffer_write(obj_client.send_buffer, buffer_s8, argument[8])//Ignore Target
			buffer_write(obj_client.send_buffer, buffer_s8, argument[9])//Filter Number
			buffer_write(obj_client.send_buffer, buffer_u8, argument[10])//arrayPos
		break;
		
		case RESPONSE_TARGET_HAND:
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_opponent))//Can choose own
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_player))//Can choose opponent		
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[2]))//Type Array
			buffer_write(obj_client.send_buffer, buffer_u8, argument[3])//Min Level
			buffer_write(obj_client.send_buffer, buffer_u8, argument[4])//Max Level
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[5]))//Archetype Array
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[6]))//Spirit Array
			buffer_write(obj_client.send_buffer, buffer_bool, argument[7])//Check Summonable
			buffer_write(obj_client.send_buffer, buffer_s8, argument[8])//Ignore Target
			buffer_write(obj_client.send_buffer, buffer_s8, argument[9])//Filter Number
			buffer_write(obj_client.send_buffer, buffer_u8, argument[10])//arrayPos
		break;
		
		case RESPONSE_TARGET_INFIRMARY:
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_opponent))//Can choose own
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_player))//Can choose opponent		
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[2]))//Type Array
			buffer_write(obj_client.send_buffer, buffer_u8, argument[3])//Min Level
			buffer_write(obj_client.send_buffer, buffer_u8, argument[4])//Max Level
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[5]))//Archetype Array
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[6]))//Spirit Array
			buffer_write(obj_client.send_buffer, buffer_bool, argument[7])//Check Summonable
			buffer_write(obj_client.send_buffer, buffer_s8, argument[8])//Send Type
			buffer_write(obj_client.send_buffer, buffer_s8, argument[9])//Ignore Target
			buffer_write(obj_client.send_buffer, buffer_s8, argument[10])//Filter Number
			buffer_write(obj_client.send_buffer, buffer_u8, argument[11])//arrayPos
		break;
		
		case RESPONSE_TARGET_INFIRMARY_NAME:
			//TODO: scr_target_infirmary_name()
		break;		
		
		case RESPONSE_TARGET_MOMENTUM_DECK:
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_opponent))//Can choose own
			buffer_write(obj_client.send_buffer, buffer_bool, array_includes(argument[1], obj_player))//Can choose opponent		
			buffer_write(obj_client.send_buffer, buffer_u8, argument[2])//Min Level
			buffer_write(obj_client.send_buffer, buffer_u8, argument[3])//Max Level
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[4]))//Archetype Array
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[5]))//Spirit Array
			buffer_write(obj_client.send_buffer, buffer_bool, argument[6])//Check Summonable
			buffer_write(obj_client.send_buffer, buffer_s8, argument[7])//Filter Number
			buffer_write(obj_client.send_buffer, buffer_u8, argument[8])//arrayPos
		break;
		
		case RESPONSE_CHOICE:
			buffer_write(obj_client.send_buffer, buffer_u8, argument[1])//arrayPos
			buffer_write(obj_client.send_buffer, buffer_string, json_stringify(argument[2]))//Choices Array
		break;
	}

	network_send_raw(obj_client.socket, obj_client.send_buffer, buffer_tell(obj_client.send_buffer));
}