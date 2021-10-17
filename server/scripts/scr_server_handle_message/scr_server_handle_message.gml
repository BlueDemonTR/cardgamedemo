function scr_server_handle_message(argument0, argument1) {
	var 
	socket_id = argument0,
	buffer = argument1;
	var temp2  = scr_find_opponent(socket_id);
	var turn = scr_find_turn(socket_id);
	while(true){
		var message_id = buffer_read(buffer, buffer_u8);	
		switch(message_id){
			case MESSAGE_JOIN:
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);
				

				network_send_raw(temp2, send_buffer,buffer_tell(send_buffer));
			
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, MESSAGE_TURN);
				buffer_write(send_buffer, buffer_u16, socket_id);
				buffer_write(send_buffer, buffer_bool, turn);
			

				network_send_raw(socket_id, send_buffer,buffer_tell(send_buffer));
			
			break;
		
			case MESSAGE_HAND_CHANGE:
			case MESSAGE_OPPONENT_HAND_CHANGE:
		
				var
				handCount = buffer_read(buffer, buffer_u8);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);
				buffer_write(send_buffer, buffer_u8, handCount);
				for(i = 0; i < handCount; i++){
					buffer_write(send_buffer, buffer_u32,buffer_read(buffer, buffer_u32))
					buffer_write(send_buffer, buffer_u8,buffer_read(buffer, buffer_u8))
					
				}
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			
			break;
		
			case MESSAGE_FIELD:
			case MESSAGE_OPPONENT_FIELD:
				var
				position = buffer_read(buffer, buffer_u8),
				cardNum = buffer_read(buffer, buffer_u32),
				artNum = buffer_read(buffer, buffer_u8),
				leaveType = buffer_read(buffer, buffer_string);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);
				buffer_write(send_buffer, buffer_u8, position);
				buffer_write(send_buffer, buffer_u32, cardNum);
				buffer_write(send_buffer, buffer_u8, artNum);
				buffer_write(send_buffer, buffer_string, leaveType);

				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_OPPONENT_INFIRMARY:
			case MESSAGE_INFIRMARY:
				var infirmaryCount = buffer_read(buffer, buffer_u8);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);
				buffer_write(send_buffer, buffer_u8, infirmaryCount);
				for(i = 0; i < infirmaryCount; i++){
					buffer_write(send_buffer, buffer_u32,buffer_read(buffer, buffer_u32))
					buffer_write(send_buffer, buffer_u8,buffer_read(buffer, buffer_u8))
					buffer_write(send_buffer, buffer_u8,buffer_read(buffer, buffer_u8))
				}
			
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_OPPONENT_MOMENTUM_DECK:
			case MESSAGE_MOMENTUM_DECK:
				var momentumDeckCount = buffer_read(buffer, buffer_u8);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);			
				buffer_write(send_buffer, buffer_u8, momentumDeckCount);
				for(i = 0; i < momentumDeckCount; i++){
					buffer_write(send_buffer, buffer_u32,buffer_read(buffer, buffer_u32))
					buffer_write(send_buffer, buffer_u8,buffer_read(buffer, buffer_u8))
				}
			
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_OPPONENT_STATS:
			case MESSAGE_STATS:
				var playerHP = buffer_read(buffer, buffer_u8);
				var mana = buffer_read(buffer, buffer_u8);
				var momentum  = buffer_read(buffer, buffer_u8);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);			
				buffer_write(send_buffer, buffer_u8, playerHP);
				buffer_write(send_buffer, buffer_u8, mana);
				buffer_write(send_buffer, buffer_u8, momentum);
			
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_OPPONENT_FIELD_CARD_STATS:
			case MESSAGE_FIELD_CARD_STATS:
		
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);			
				buffer_write(send_buffer, buffer_u8, buffer_read(buffer, buffer_u8));//Position
				
				var statCount = buffer_read(buffer, buffer_u8)
				//buffer_write(send_buffer, buffer_u8, statCount)
				for(var i = 0; i < statCount; i++){//Stats
					buffer_write(send_buffer, buffer_u16, buffer_read(buffer, buffer_s16));
				}
				var statusCount = buffer_read(buffer, buffer_u8)
				//buffer_write(send_buffer, buffer_u8, statusCount)
				for(var i = 0; i < statusCount; i++){//Statuses
					buffer_write(send_buffer, buffer_bool, buffer_read(buffer, buffer_bool));
				}
				//var archetypeCount = buffer_read(buffer, buffer_u8)
				//buffer_write(send_buffer, buffer_u8, archetypeCount)
				//for(var i = 0; i < archetypeCount; i++){//Archetypes
				//	buffer_write(send_buffer, buffer_u16, buffer_read(buffer, buffer_u16));
				//}
				
				//var sharedEffectCount = buffer_read(buffer, buffer_u8)
				//buffer_write(send_buffer, buffer_u8, sharedEffectCount)
				//for(var i = 0; i < sharedEffectCount; i++){//Shared Effects
				//	buffer_write(send_buffer, buffer_u16, buffer_read(buffer, buffer_u16));
				//}
				
				buffer_write(send_buffer, buffer_u8, buffer_read(buffer, buffer_u8));//Attacks Left
			
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_OPPONENT_DECK_CHANGE:
			case MESSAGE_DECK_CHANGE:
				var deckCount = buffer_read(buffer, buffer_u8);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);			
				buffer_write(send_buffer, buffer_u8, deckCount);
				for(i = 0; i < deckCount; i++){
					buffer_write(send_buffer, buffer_u32,buffer_read(buffer, buffer_u32))
					buffer_write(send_buffer, buffer_u8,buffer_read(buffer, buffer_u8))
				}
			
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_LAST_ACTION:
				var message = buffer_read(buffer, buffer_string);
			
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);			
				buffer_write(send_buffer, buffer_string, message);
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
			case MESSAGE_WIN:
			case MESSAGE_END_TURN:
				buffer_seek(send_buffer, buffer_seek_start, 0);
				buffer_write(send_buffer, buffer_u8, message_id);
				buffer_write(send_buffer, buffer_u16, socket_id);
			
				network_send_raw(temp2, send_buffer, buffer_tell(send_buffer));
			break;
		
		}
		
		if(buffer_tell(buffer)) == buffer_get_size(buffer){
			break;
		}
		
	}


}
