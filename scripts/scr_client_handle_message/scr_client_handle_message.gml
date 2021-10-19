function scr_client_handle_message(argument0) {
	var buffer = argument0
	while(true){
		var message_id = buffer_read(buffer, buffer_u8);
		show_debug_message(message_id)
		var client = buffer_read(buffer, buffer_u16);
		
		//opponentObject = scr_opponent_get_object(client);
	
		switch(message_id){
			case MESSAGE_JOIN:
		
				opponentObject = scr_opponent_get_object(client);
			break;
			case MESSAGE_HAND_CHANGE:
		
				opponentObject = scr_opponent_get_object(client);
			
				with(opponentObject){
					handCount = buffer_read(buffer, buffer_u8);	
					for(var i = 0; i < handCount; i++){
						hand[i,0] = buffer_read(buffer, buffer_u32);
						hand[i,1] = buffer_read(buffer, buffer_u8);
					}
					for(var i = handCount; i < 7; i++){
						hand[i,0] = 0;
						hand[i,1] = 0;
					}
				}
			break;
			case MESSAGE_FIELD:
				var position = buffer_read(buffer, buffer_u8),
				cardNum = buffer_read(buffer, buffer_u32),
				artNum = buffer_read(buffer, buffer_u8),
				animationType = buffer_read(buffer, buffer_string);
				
				with(opponentObject){
					if(fieldCard[position] != noone){
						fieldCard[position].animationType = animationType
					}					
					field[position, 0] = cardNum;
					field[position,1] = artNum;
				}
			break;
			case MESSAGE_INFIRMARY:
				with(opponentObject){
					infirmaryCount = buffer_read(buffer, buffer_u8);	
					for(var i = 0; i < infirmaryCount; i++){
						infirmary[i,0] = buffer_read(buffer, buffer_u32);
						infirmary[i,1] = buffer_read(buffer, buffer_u8);
						infirmary[i,2] = buffer_read(buffer, buffer_u8);
					}
					for(var i = infirmaryCount; i < 999; i++){
						infirmary[i,0] = 0;
						infirmary[i,1] = 0;
						infirmary[i,2] = 0;
					}
				}
			break;
			case MESSAGE_MOMENTUM_DECK:
				with(opponentObject){
					momentumDeckCount = buffer_read(buffer,buffer_u8);
					for(var i = 0; i < momentumDeckCount; i++){
						momentumDeck[i, 0] = buffer_read(buffer, buffer_u32);
						momentumDeck[i, 1] = buffer_read(buffer, buffer_u8);
					}
					for(var i = momentumDeckCount; i < 15; i++){
						momentumDeck[i, 0] = 0;
						momentumDeck[i, 1] = 0;
					}
				}
			break;		
			case MESSAGE_STATS:
				opponentObject = scr_opponent_get_object(client);
				with(opponentObject){
					playerHP = buffer_read(buffer, buffer_u8);
					mana = buffer_read(buffer, buffer_u8);
					momentum = buffer_read(buffer, buffer_u8);
				}
			
			break;
			case MESSAGE_FIELD_CARD_STATS:
				with(opponentObject){
					
					var field_location = buffer_read(buffer, buffer_u8);
					
					if(fieldCard[field_location] == noone){
						break;
					}	
					for(var i = 0; i < macros.stat_count; i++){//Stats
						fieldCard[field_location].cardStat[i] = buffer_read(buffer, buffer_u16)
					}
					for(var i = 0; i < macros.status_count; i++){//Statuses
						fieldCard[field_location].cardStatus[i] = buffer_read(buffer, buffer_bool)
					}
					fieldCard[field_location].attacksLeft = buffer_read(buffer, buffer_u8);//Can it attack?
				}
			break;
			case MESSAGE_DECK_CHANGE:
				with(opponentObject){
					deckCount = buffer_read(buffer,buffer_u8);
					for(var i = 0; i < deckCount; i++){
						deck[i, 0] = buffer_read(buffer, buffer_u32);
						deck[i, 1] = buffer_read(buffer, buffer_u8);
					}
					for(var i = deckCount; i < 100; i++){
						deck[i, 0] = 0;
						deck[i, 1] = 0;
					}
				}		
			break;
			case MESSAGE_OPPONENT_STATS:
				with(obj_player){
					playerHP = buffer_read(buffer, buffer_u8);
					mana = buffer_read(buffer, buffer_u8);
					momentum = buffer_read(buffer, buffer_u8);
				}
			break;
			case MESSAGE_OPPONENT_FIELD_CARD_STATS:
				with(obj_player){
					var field_location = buffer_read(buffer, buffer_u8);
					
					if(fieldCard[field_location] == noone){
						break;
					}
					for(var i = 0; i < macros.stat_count; i++){//Stats
						fieldCard[field_location].cardStat[i] = buffer_read(buffer, buffer_u16)
					}
					for(var i = 0; i < macros.status_count; i++){//Statuses
						fieldCard[field_location].cardStatus[i] = buffer_read(buffer, buffer_bool)
					}
					fieldCard[field_location].attacksLeft = buffer_read(buffer, buffer_u8 );//Can it attack?
				}
			break;
			case MESSAGE_OPPONENT_DECK_CHANGE:
				with(obj_player){
					deckCount = buffer_read(buffer,buffer_u8);
					for(var i = 0; i < deckCount; i++){
						deck[i, 0] = buffer_read(buffer, buffer_u32);
						deck[i, 1] = buffer_read(buffer, buffer_u8);
					}
					for(var i = deckCount; i < 100; i++){
						deck[i, 0] = 0;
						deck[i, 1] = 0;
					}
				}
			break;
			case MESSAGE_OPPONENT_INFIRMARY:
				with(obj_player){
					infirmaryCount = buffer_read(buffer, buffer_u8);	
					for(var i = 0; i < infirmaryCount; i++){
						infirmary[i,0] = buffer_read(buffer, buffer_u32);
						infirmary[i,1] = buffer_read(buffer, buffer_u8);
						infirmary[i,2] = buffer_read(buffer, buffer_u8);
					}
					for(var i = infirmaryCount; i < 999; i++){
						infirmary[i,0] = 0;
						infirmary[i,1] = 0;
						infirmary[i,2] = 0;
					}
					if(infirmaryCount != 0){
						obj_infirmary.cardOnTop = infirmary[infirmaryCount-1,0]
						obj_infirmary.artOnTop = infirmary[infirmaryCount-1,1]
					}else{
						obj_infirmary.cardOnTop = 0
						obj_infirmary.artOnTop = 0
					}
				}
			break;
			case MESSAGE_OPPONENT_FIELD:
				var position = buffer_read(buffer, buffer_u8),
				cardNum = buffer_read(buffer, buffer_u32),
				artNum = buffer_read(buffer, buffer_u8),
				animationType = buffer_read(buffer, buffer_string);
				
				with(obj_player){
					if(fieldCard[position] != noone){
						fieldCard[position].animationType = animationType
					}					
					field[position, 0] = cardNum;
					field[position,1] = artNum;
				}
			break;
			case MESSAGE_OPPONENT_MOMENTUM_DECK:
				with(obj_player){
					momentumDeckCount = buffer_read(buffer,buffer_u8);
					for(var i = 0; i < momentumDeckCount; i++){
						momentumDeck[i, 0] = buffer_read(buffer, buffer_u32);
						momentumDeck[i, 1] = buffer_read(buffer, buffer_u8);
					}
					for(var i = momentumDeckCount; i < 15; i++){
						momentumDeck[i, 0] = 0;
						momentumDeck[i, 1] = 0;
					}
				}
			break;
			case MESSAGE_OPPONENT_HAND_CHANGE:
				with(obj_player){
					handCount = buffer_read(buffer, buffer_u8);	
					for(var i = 0; i < handCount; i++){
						hand[i,0] = buffer_read(buffer, buffer_u32);
						hand[i,1] = buffer_read(buffer, buffer_u8);
					}
					for(var i = handCount; i < 7; i++){
						hand[i,0] = 0;
						hand[i,1] = 0;
					}
				}
			break;
			case MESSAGE_TURN:
		
				with(obj_player){
					own_turn = buffer_read(buffer,buffer_bool);
				}
			break;
			case MESSAGE_LAST_ACTION:
		
				with(obj_action_list){
					last_action++;
					action_list[last_action] = buffer_read(buffer,buffer_string);
				}
			break;
			case MESSAGE_WIN:
			case MESSAGE_LEAVE:
				if(obj_player.victory_state = 0){
					obj_player.own_turn = false;
					obj_player.victory_state=1;
				}
			break;
			case MESSAGE_END_TURN:
				with(obj_player){
					turn_count++;
					own_turn = true;
					start_turn = true;
				}
			break;
			case MESSAGE_OUTDATED:
				alarm[1] = 120
			break;
		
			
		}
		var temptell = buffer_tell(buffer),
		var tempsize = buffer_get_size(buffer);
		
		if(buffer_tell(buffer) == buffer_get_size(buffer)){
			break;
		}
	}


}
