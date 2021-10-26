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
				animationType = buffer_read(buffer, buffer_string);

				with(opponentObject){
					field[position,0] = cardNum;
					field[position,1] = artNum;
					if(instance_exists(fieldCard[position])){
						if(fieldCard[position].cardNum == cardNum){
							break;//Everything is fine
						}
						if(cardNum == 0){
							scr_remove_from_field(player, position, animationType)
							break;//Card has left the field
						}
						with(fieldCard[position]){
							self.cardNum = cardNum
							self.artNum = artNum
							summoning_method = SummonInvalid

							scr_info_to_instance(cardNum);
							effectUsesLeft = getStat(StatEffectUsesPerTurn)
							sacrificable = false
							attacksLeft = 1

							recruit=false;
						}
						break;//Card has turned into another card without ever leaving the field (THIS SHOULDN'T HAPPEN(I think))
					}
					with(scr_summon([cardNum, artNum], player, SummonInvalid, "", position)){
						summoning_method = animationType
						break;//Summon a new card
					}
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
				opponentObject = scr_opponent_get_object(client);
				with(opponentObject){
					scr_set_stat_player(self, PlayerHP, buffer_read(buffer, buffer_u8))
					scr_set_stat_player(self, PlayerMana, buffer_read(buffer, buffer_u8))
					scr_set_stat_player(self, PlayerMomentum, buffer_read(buffer, buffer_u8))
				}

			break;
			case MESSAGE_FIELD_CARD_STATS:
				with(opponentObject){

					var position = buffer_read(buffer, buffer_u8);

					if(fieldCard[position] == noone){
						break;
					}
					for(var i = 0; i < macros.stat_count; i++){//Stats
						scr_set_stat_card(self, position, i, buffer_read(buffer, buffer_u16))
					}
					for(var i = 0; i < macros.status_count; i++){//Statuses
						scr_set_status_card(self, position, i, buffer_read(buffer, buffer_bool))
					}
					fieldCard[position].attacksLeft = buffer_read(buffer, buffer_u8);//Can it attack?
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
					scr_set_stat_player(self, PlayerHP, buffer_read(buffer, buffer_u8))
					scr_set_stat_player(self, PlayerMana, buffer_read(buffer, buffer_u8))
					scr_set_stat_player(self, PlayerMomentum, buffer_read(buffer, buffer_u8))
				}
			break;
			case MESSAGE_OPPONENT_FIELD_CARD_STATS:
				with(obj_player){

					var position = buffer_read(buffer, buffer_u8);

					if(fieldCard[position] == noone){
						break;
					}
					for(var i = 0; i < macros.stat_count; i++){//Stats
						scr_set_stat_card(self, position, i, buffer_read(buffer, buffer_u16))
					}
					for(var i = 0; i < macros.status_count; i++){//Statuses
						scr_set_status_card(self, position, i, buffer_read(buffer, buffer_bool))
					}
					fieldCard[position].attacksLeft = buffer_read(buffer, buffer_u8);//Can it attack?
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
					scr_update_infirmary()
				}
			break;
			case MESSAGE_OPPONENT_FIELD:
				var position = buffer_read(buffer, buffer_u8),
				cardNum = buffer_read(buffer, buffer_u32),
				artNum = buffer_read(buffer, buffer_u8),
				animationType = buffer_read(buffer, buffer_string);//This is leaveType or summonType

				with(obj_player){
					field[position,0] = cardNum;
					field[position,1] = artNum;
					if(instance_exists(fieldCard[position])){
						if(fieldCard[position].cardNum == cardNum){
							break;//Everything is fine
						}
						if(cardNum == 0){
							scr_remove_from_field(player, position, animationType)
							break;//Card has left the field
						}
						with(fieldCard[position]){
							self.cardNum = cardNum
							self.artNum = artNum
							summoning_method = SummonInvalid

							scr_info_to_instance(cardNum);
							effectUsesLeft = getStat(StatEffectUsesPerTurn)
							sacrificable = false
							attacksLeft = 1

							recruit=false;
						}
						break;//Card has turned into another card without ever leaving the field (THIS SHOULDN'T HAPPEN(I think))
					}
					with(scr_summon([cardNum, artNum], player, SummonInvalid, "", position)){
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
								if([handCard[i].cardNum, handCard[i].artNum] == hand[i]){
									continue;//Everything is fine
								}
								scr_remove_from_hand(player, i--)
								continue;//A card is removed from the middle of the hand
							}
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


		}
		var temptell = buffer_tell(buffer),
		var tempsize = buffer_get_size(buffer);

		if(false){
			temptell = tempsize//This is here because I am sick of the syntax error pop up
		}

		if(buffer_tell(buffer) == buffer_get_size(buffer)){
			break;
		}
	}


}
