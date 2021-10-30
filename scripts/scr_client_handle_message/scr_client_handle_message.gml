function scr_client_handle_message(buffer) {
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
				animationType = buffer_read(buffer, buffer_u8);

				opponentObject.field[position,0] = cardNum;
				opponentObject.field[position,1] = artNum;
				if(instance_exists(opponentObject.fieldCard[position])){
					if(opponentObject.fieldCard[position].cardNum == cardNum){
						break;//Everything is fine
					}
					if(cardNum == 0){
						scr_remove_from_field(opponentObject, position, animationType)
						break;//Card has left the field
					}
					with(opponentObject.fieldCard[position]){
						self.cardNum = cardNum
						self.artNum = artNum
						summoning_method = SummonInvalid

						scr_info_to_instance(cardNum);
						summoning_method = animationType
						effectUsesLeft = getStat(StatEffectUsesPerTurn)
						sacrificable = false
						attacksLeft = 1

						recruit = false;
					}
					break;//Card has turned into another card without ever leaving the field (THIS SHOULDN'T HAPPEN(I think))
				}
				with(scr_summon([cardNum, artNum], opponentObject, SummonInvalid, 0, position)){
					summoning_method = animationType
					break;//Summon a new card
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
				scr_set_stat_player(opponentObject, PlayerHP, buffer_read(buffer, buffer_u8))
				scr_set_stat_player(opponentObject, PlayerMana, buffer_read(buffer, buffer_u8))
				scr_set_stat_player(opponentObject, PlayerMomentum, buffer_read(buffer, buffer_u8))
			break;
			case MESSAGE_FIELD_CARD_STATS:
				var position = buffer_read(buffer, buffer_u8);

				if(opponentObject.fieldCard[position] == noone){
					break;
				}
				for(var i = 0; i < macros.stat_count; i++){//Stats
					scr_set_stat_card(opponentObject, position, i, buffer_read(buffer, buffer_u16))
				}
				for(var i = 0; i < macros.status_count; i++){//Statuses
					scr_set_status_card(opponentObject, position, i, buffer_read(buffer, buffer_bool))
				}
				opponentObject.fieldCard[position].attacksLeft = buffer_read(buffer, buffer_u8);//Can it attack?
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
				scr_set_stat_player(obj_player, PlayerHP, buffer_read(buffer, buffer_u8))
				scr_set_stat_player(obj_player, PlayerMana, buffer_read(buffer, buffer_u8))
				scr_set_stat_player(obj_player, PlayerMomentum, buffer_read(buffer, buffer_u8))
			break;
			case MESSAGE_OPPONENT_FIELD_CARD_STATS:
				var position = buffer_read(buffer, buffer_u8);

				if(obj_player.fieldCard[position] == noone){
					break;
				}
				for(var i = 0; i < macros.stat_count; i++){//Stats
					scr_set_stat_card(obj_player, position, i, buffer_read(buffer, buffer_u16))
				}
				for(var i = 0; i < macros.status_count; i++){//Statuses
					scr_set_status_card(obj_player, position, i, buffer_read(buffer, buffer_bool))
				}
				obj_player.fieldCard[position].attacksLeft = buffer_read(buffer, buffer_u8);//Can it attack?	
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
					scr_update_infirmary()
				}
			break;
			case MESSAGE_OPPONENT_FIELD:
				var position = buffer_read(buffer, buffer_u8),
				cardNum = buffer_read(buffer, buffer_u32),
				artNum = buffer_read(buffer, buffer_u8),
				animationType = buffer_read(buffer, buffer_u8);//This is leaveType or summonType

				obj_player.field[position,0] = cardNum;
				obj_player.field[position,1] = artNum;
				if(instance_exists(obj_player.fieldCard[position])){
					if(obj_player.fieldCard[position].cardNum == cardNum){
						break;//Everything is fine
					}
					if(cardNum == 0){
						scr_remove_from_field(obj_player, position, animationType)
						break;//Card has left the field
					}
					with(obj_player.fieldCard[position]){
						self.cardNum = cardNum
						self.artNum = artNum
						summoning_method = SummonInvalid

						scr_info_to_instance(cardNum);
						summoning_method = animationType
						
						effectUsesLeft = getStat(StatEffectUsesPerTurn)
						sacrificable = false
						attacksLeft = 1

						recruit=false;
					}
					break;//Card has turned into another card without ever leaving the field (THIS SHOULDN'T HAPPEN(I think))
				}
				if(cardNum != 0){
					with(scr_summon([cardNum, artNum], obj_player, SummonInvalid, 0, position)){
						summoning_method = animationType
						break;//New card is summoned
					}
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
					for(var i = handCount; i < handSizeLimit; i++){
						hand[i,0] = 0;
						hand[i,1] = 0;
					}
					for(var i = 0; i < handSizeLimit; i++){
						if(hand[i,0] != 0){
							if(instance_exists(handCard[i])){
								if(handCard[i].cardNum == hand[i,0] && handCard[i].artNum == hand[i,1]){
									continue;//Everything is fine
								}
								scr_remove_from_hand(player, i--)
								continue;//A card is removed from the middle of the hand
							}
							handCount--
							scr_add_to_hand(player, hand[i])//A card is sent to the hand
							continue
						}
						if(instance_exists(handCard[i])){
							scr_remove_from_hand(player, i)//A card is removed from the end of the hand
							continue;
						}
						break;
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
					obj_player.victory_state = 1;
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
			
			case MESSAGE_ASK_RESPONSE:
				var response_id = buffer_read(buffer, buffer_u8);
				with(obj_player){
					switch(response_id){
						case RESPONSE_CHOOSE_FIELD_ZONE:
							var players = []
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_player)
							}
							if(buffer_read(buffer, buffer_bool)){
							array_push(players, obj_opponent)
							}
							var selectFilled = buffer_read(buffer, buffer_bool),
							selectNMZ = buffer_read(buffer, buffer_bool),
							selectMMZ = buffer_read(buffer, buffer_bool),
							arrayPos = buffer_read(buffer, buffer_u8);
							
							scr_choose_field_zones(obj_player, players, selectFilled, selectNMZ, selectMMZ, arrayPos)
						break;
		
						case RESPONSE_TARGET_DECK:						
							var players = []
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_player)
							}
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_opponent)
							}
							var typeArray = json_parse(buffer_read(buffer, buffer_string)),
							minLevel = buffer_read(buffer, buffer_u8),
							maxLevel = buffer_read(buffer, buffer_u8),
							archetypeArray = json_parse(buffer_read(buffer, buffer_string)),
							spiritArray = json_parse(buffer_read(buffer, buffer_string)),
							checkSummonable = buffer_read(buffer, buffer_bool),
							filterNum = buffer_read(buffer, buffer_s8),
							arrayPos = buffer_read(buffer, buffer_u8);
							
							scr_target_deck(obj_player, players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, filterNum, arrayPos)
						break;
		
						case RESPONSE_TARGET_FIELD:
							var players = []
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_player)
							}
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_opponent)
							}
							var typeArray = json_parse(buffer_read(buffer, buffer_string)),
							level = json_parse(buffer_read(buffer, buffer_string)),
							atk = json_parse(buffer_read(buffer, buffer_string)),
							hp = json_parse(buffer_read(buffer, buffer_string)),
							archetypeArray = json_parse(buffer_read(buffer, buffer_string)),
							spiritArray = json_parse(buffer_read(buffer, buffer_string)),
							ignoreTarget = buffer_read(buffer, buffer_s8),
							filterNum = buffer_read(buffer, buffer_s8),
							arrayPos = buffer_read(buffer, buffer_u8);
							
							scr_target_field(obj_player, players, typeArray, level, atk, hp, archetypeArray, spiritArray, ignoreTarget, filterNum, arrayPos)
						break;
		
						case RESPONSE_TARGET_HAND:
							var players = []
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_player)
							}
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_opponent)
							}
							var typeArray = json_parse(buffer_read(buffer, buffer_string)),
							minLevel = buffer_read(buffer, buffer_u8),
							maxLevel = buffer_read(buffer, buffer_u8),
							archetypeArray = json_parse(buffer_read(buffer, buffer_string)),
							spiritArray = json_parse(buffer_read(buffer, buffer_string)),
							checkSummonable = buffer_read(buffer, buffer_bool),
							ignoreTarget = buffer_read(buffer, buffer_s8),
							filterNum = buffer_read(buffer, buffer_s8),
							arrayPos = buffer_read(buffer, buffer_u8);
							
							scr_target_hand(obj_player, players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, ignoreTarget, filterNum, arrayPos)

						break;
		
						case RESPONSE_TARGET_INFIRMARY:
							var players = []
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_player)
							}
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_opponent)
							}
							var typeArray = json_parse(buffer_read(buffer, buffer_string)),
							minLevel = buffer_read(buffer, buffer_u8),
							maxLevel = buffer_read(buffer, buffer_u8),
							archetypeArray = json_parse(buffer_read(buffer, buffer_string)),
							spiritArray = json_parse(buffer_read(buffer, buffer_string)),
							checkSummonable = buffer_read(buffer, buffer_bool),
							sendType = buffer_read(buffer, buffer_s8),
							ignoreTarget = buffer_read(buffer, buffer_s8),
							filterNum = buffer_read(buffer, buffer_s8),
							arrayPos = buffer_read(buffer, buffer_u8);
							
							scr_target_infirmary(obj_player, players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, sendType, ignoreTarget, filterNum, arrayPos)
						break;
		
						case RESPONSE_TARGET_INFIRMARY_NAME:
							//TODO: scr_target_infirmary_name()
						break;		
		
						case RESPONSE_TARGET_MOMENTUM_DECK:
							var players = []
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_player)
							}
							if(buffer_read(buffer, buffer_bool)){
								array_push(players, obj_opponent)
							}
							var minLevel = buffer_read(buffer, buffer_u8),
							maxLevel = buffer_read(buffer, buffer_u8),
							archetypeArray = json_parse(buffer_read(buffer, buffer_string)),
							spiritArray = json_parse(buffer_read(buffer, buffer_string)),
							checkSummonable = buffer_read(buffer, buffer_bool),
							filterNum = buffer_read(buffer, buffer_s8),
							arrayPos = buffer_read(buffer, buffer_u8);
							
							scr_target_momentum_deck(obj_player, players, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, filterNum, arrayPos)
						break;
		
						case RESPONSE_CHOICE:
							var arrayPos = buffer_read(buffer, buffer_u8),
							choicesArray = json_parse(buffer_read(buffer, buffer_string));
							
							scr_give_choice(arrayPos, choicesArray)
						break;
					}
				}
			break;

			case MESSAGE_HANDLE_RESPONSE:
				var arrayPos = buffer_read(buffer, buffer_u8),
				arguments = json_parse(buffer_read(buffer, buffer_string));
				
				for(var i = 0; i < array_length(arguments); i++){
					obj_player.resolvingPile[obj_player.resolvingPileCount - 1, arrayPos + i] = arguments[i]
				}
				
				obj_player.resolvingPile[obj_player.resolvingPileCount - 1, 2]++
			break;

			case MESSAGE_HANDLE_FAIL:
				obj_player.resolvingPile[obj_player.resolvingPileCount - 1, 2] = 98
			break;
		}
		var temptell = buffer_tell(buffer),
		var tempsize = buffer_get_size(buffer);

		if(temptell == tempsize){
			break;
		}
	}


}
