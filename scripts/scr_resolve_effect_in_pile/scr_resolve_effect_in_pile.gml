function scr_resolve_effect_in_pile(positionInOrder){
	var cardNum = resolutionPile[positionInOrder, 0],
	effectNum = resolutionPile[positionInOrder, 1],
	resolutionStep = resolutionPile[positionInOrder, 2],
	position = resolutionPile[positionInOrder, 3],
	effectSilenced = resolutionPile[positionInOrder,4];
	
	switch(cardNum){
		case "WheelGain2"://Visclades Wheel Gain
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						scr_give_player_stats(player, 0, 0, 0, resolutionPile[positionInOrder, 5])
					}
					resolutionPile[positionInOrder,2] = 99;
				break;
			}			
		break;
		case "Shared3"://Visclades Shared Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						scr_give_player_stats(player, 0, 0, 1, 0)
						wheel_locked = true;
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}
		break;
		case "Shared4"://Underground Visclades Shared Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 5, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,6] = -1
								scr_choose_field_zones(true, false, false, true, false, 6);
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 1://Motorbiker Showman Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						scr_give_player_stats(obj_player, 0, 0, 0, 1);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}				
		break;
		case 2://Motorbiker Doppelganger Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = -1
								scr_choose_field_zones(true, false, false, true, false, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_summon_from_deck_name(2, resolutionPile[positionInOrder,5]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 3://Motorbiker Wild Rider Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						scr_burn(opponent,2,cardNum)
						scr_give_player_stats(player,0,0,0,1)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}
		break;		
		case 4://Motorbiker V-Rider Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if(field[i,0]> 0){
								if(scr_check_archetype(field[i,0], 1)){
									scr_buff_card(player, i, 0, 1, 0, 0, 0, 0, 0);
								}
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}
		break;
		case 5://Motorbiker D-Rider Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if(field[i,0]> 0){
								if(scr_check_archetype(field[i,0], 1)){
									scr_buff_card(player, i, 0, 0, 1, 1, 0, 0, 0);
								}
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		
		case 6://Motorbiker Violent Wheeler Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						cardcan_attack = true;
						cardStatus[12] = false;			
					}
					scr_message_field_card_stats(position)	
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		
		case 7://Motorbiker Protector Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if(field[i,0]> 0){
								if(scr_check_archetype(field[i,0], 1)){
									scr_buff_card(player, i, 0, 0, 0, 0, 1, 0, 0);
								}
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 8://Rev Up the Engines Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								scr_target_deck(1,5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder,5])
								scr_give_player_stats(player, 0, 0, 0, 3)
								wheel_locked = true;
								resolutionPile[positionInOrder,2]++
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2]++
					}
				break;
			}	
		break;
		case 9://Leader Takeover Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player,2,5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,6] = 0
								scr_target_momentum_deck(3,6);
								scr_voidfy_infirmary(obj_player, resolutionPile[positionInOrder,5]);
								resolutionPile[positionInOrder,2]++
							break;
							case 4:
								resolutionPile[positionInOrder,7] = 0
								scr_choose_field_zones(true, false, false, false, true, 7);
								resolutionPile[positionInOrder,2]++
							break;
							case 6:
								scr_summon_momentum_deck(positionInOrder, resolutionPile[positionInOrder,7]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 10://The Hunt is on Boys! Effect
			switch(effectNum){
				case 0:
					scr_burn(obj_opponent,5,cardNum);
					for (i = 0; i < 5 ;i++){
						if(obj_opponent.fieldCard[i] != noone) {
							scr_damage_card(obj_opponent, i, 5);
						}
					}
					scr_discard(position)				
				break;
			}
		break;	
		case 11://Motorbiker Leader Khan Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 5] = 0
								scr_target_deck(2,5);
								resolutionPile[positionInOrder, 2]++
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								resolutionPile[positionInOrder, 2]++
							break;
							case 5:
								scr_summon_from_deck(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder, 6])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;			
		case 12://Motorbiker Leader Luther Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_damage_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5] ,player.fieldCard[position].cardStat[1])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 13://Motorbiker Leader Toku Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						with(player.fieldCard[position]){
							cardStat[3] = round(cardStat[3]/2);
							scr_buff_card(player, position, 0, 4, 0, 0, 0, 0, 0);					
						}
					}
				break;
			}
		break;
		case 14://Motorbiker Leader Luther Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, -2, 0, 0, 0, 0, 0)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}							
				break;
			}
		break;
		case 15://Motorbiker Leader Ceasar Effect
			switch(effectNum){
				
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						scr_burn(opponent,2,15);
					}
				break;
			}
		break;
		case 16://EoS Embodiment of Speed Effect
			switch(!fieldCard[position].cardStatus[11] && effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								with(resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]]){
									var absorbCount = 0;
									absorbCount += cardStat[1]-1;
									absorbCount += cardStat[3]-1;
									cardStat[1] = 1;
									cardStat[2] = 1;
									cardStat[3] = 1;
									scr_message_opponent_field_card_stats(position)
								}
								scr_buff_card(player, position, 0, absorbCount, 0, 0, 0, 0, 0)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}
				break;
			}
		break;
		case 17://Lentus Vio Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						cardcan_attack = true;
						scr_buff_card(player, position, 0, +1, -1, -1, 0, 0, 0);
					}
					scr_message_field_card_stats(position)	
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 18://Riti Ava Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						with(player){scr_draw(1, true)}				
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 19://Idine Lib Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 6] = scr_find_infirmary(opponent, resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder, 7] = opponent.infirmary[resolutionPile[positionInOrder,6],1]
								with(opponent){
									scr_remove_from_infirmary(resolutionPile[positionInOrder,6]);
								}
								resolutionPile[positionInOrder,2]++
								
							break;
							case 2:
								resolutionPile[positionInOrder, 8] = 0
								scr_choose_field_zones(true, false, false, true, true, 8);
								resolutionPile[positionInOrder,2]++
							break;
							case 4:
								with(scr_summon(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder, 7], player, "effect", "opponentInfirmaryToField", resolutionPile[positionInOrder, 8])){
									scr_silence(player, self.position);
									cardStatus[9] = true;
									if(player == obj_player){
										scr_message_field_card_stats(position);
									}else if(player == obj_opponent){
										scr_message_opponent_field_card_stats(position);
									}
								}
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 20://Satio Ces Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						scr_spin(player, position);
					}
					resolutionPile[positionInOrder,2] = 99					
				break;
			}
		break;
		case 21://Luvies Ing Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						player.fieldCard[position].cardis_sacrificable = true;
						scr_buff_card(player,position, 4, 0, 0, 0, 0, 0, 0)
						scr_limit_summon_to(3, 0);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_voidfy_infirmary(player, position)
								scr_target_field("player", "all", 0, 13, "any", 3, -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, 0, 2, 2, 0, 0, 0)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}				
				break;
			}
		break;
		case 22://Tia Invaden Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("all", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_copy_stats(resolutionPile[positionInOrder,6], fieldCard[resolutionPile[positionInOrder,5]], false, true, true, true, false, false, false)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 23://Gloria Fastus Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if (opponent.field[i,0] > 0){
								scr_damage_card(opponent, i, 1);
							}
						}
						scr_damage_card(player, position, 4);

						scr_burn(player,4,cardNum)
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 24://Cries of the Underworld Effect
			switch(effectNum){
				case 0:			
					if(!effectSilenced && scr_count_infirmary_filter(obj_player, 4) >= 4){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 5] = 0
								scr_target_momentum_deck(4, 5);
								resolutionPile[positionInOrder, 2]++
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, false, true, 6);
								resolutionPile[positionInOrder, 2]++
							break;
							case 5:
								with(scr_summon_momentum_deck(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder, 6])){
										cardStatus[13] = true;
								}
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 25://Second Coming Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && scr_count_infirmary_filter(obj_player, 4, "any") >= 4){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 5, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								resolutionPile[positionInOrder, 2]++							
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 26://Bloody Sacrifice
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_deck(4,5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_mill(resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2]++
							break;
							case 4:
								resolutionPile[positionInOrder,6] = 0
								resolutionPile[positionInOrder,7] = 0
								scr_target_field("player", "all", 0, 13, "any", 3, -1, 6)
								resolutionPile[positionInOrder,2]++
							break;
							case 6:
								scr_buff_card(resolutionPile[positionInOrder,7], resolutionPile[positionInOrder,6], 0, 2, 0, 0, 0, 0, 0)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 27://Visclades Denial Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_silence(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;//Visclades Anger Effect
		case 28:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_burn(obj_player,2,cardNum);
						scr_burn(obj_opponent,2,cardNum);
						for(var i = 0; i < 5; i++){
							if(obj_player.field[i,0] > 0){
								scr_damage_card(obj_player, i, 2)
							}
						}
						for(var i = 0; i < 5; i++){
							if(obj_opponent.field[i,0] > 0){
								scr_damage_card(obj_opponent, i, 2)
							}
						}					
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 29://Visclades Bargaining Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						var temp1 = obj_player.mana
						obj_player.mana = 0
						scr_give_player_stats(player, 0, temp1*3, 0, 0)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}			
		break;
		case 30://Visclades Depression Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						for(var i = 0; i < 5; i++){
							if(obj_opponent.field[i,0] > 0){
								if(!obj_opponent.fieldCard[i].cardStatus[3]){
									obj_opponent.fieldCard[i].cardStatus[7] = true;
									scr_message_opponent_field_card_stats(i);
								}
							}
						}
					}
				break;
			}
		break;
		case 31://Visclades Acceptance Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						var visclades=0;
						for (i = 0; i < obj_player.infirmaryCount; i++){
							if(scr_check_archetype(obj_player.infirmary[i,0], 3)){
								visclades++
							}
						}
						scr_buff_card(player, position, 0, visclades, visclades, visclades, 0, 0, 0);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						fieldCard[position].cardStatus[4] = false;
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 33://Pole Clan Builder Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = -1
								scr_choose_field_zones(true, false, false, true, false, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_summon_from_deck_name(32, resolutionPile[positionInOrder,5]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}	
		break;	
		case 34://Pole Clan Archer Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_burn(opponent, 3, cardNum)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 35://Pole Clan Mage Effect
			switch(effectNum){
				case 0:
							
					if(scr_if_you_control_filter(6) && !fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_deck(8, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						if(obj_player.fieldCard[position] != noone){
							scr_hopt_used(cardNum)
						}							
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}						
		break;
		case 36://Pole Clan Defender Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						for(i = 0; i < 5; i++){
							scr_buff_card(player, i, 0, 0, 0, 0, 0, 0, 1)
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						for(i = 0; i < 5; i++){
							scr_heal_card(player, i, 1)
						}					
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 37://Pole Clan Beast Effect
			switch(effectNum){
				case 0:
					if(scr_if_you_control_filter(6) && !fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_buff_card(player, position, 0, 3, 2, 2, 0, 0, 0)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 38://Pole Clan Torch Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_burn(opponent, 1, cardNum)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}			
		break;
		case 39://Blizzard Icewall Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_pay_momentum(1);
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0 //player
								scr_target_field("all", "all", 0, 13, "any", 5, -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, 0, 5, 5, 0, 0, 0)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;		
		case 40://Blizzard Icicle Storm Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_pay_momentum(3);
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0 //player
								scr_target_field("all", "all", 0, 13, "any", 5, -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_burn(obj_opponent, resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]].cardStat[1], cardNum)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 41://Blizzard Recruitment Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_deck(7, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 42://Blizzard Hibernation Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && player.momentum >= 3){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,6].resolutionPile[positionInOrder,5].cardStatus[9] = true
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;			
		case 43://Blizzard Lockdown Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && player.momentum >= 3){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_hand(9, 5, position)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder, 5])
								resolutionPile[positionInOrder,7] = 0
								resolutionPile[positionInOrder,8] = 0
								scr_target_field("opponent", "all", 0, macros.origStat[resolutionPile[positionInOrder,6], 0], "any", "any",-1, 7)
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_silence(resolutionPile[positionInOrder,8], resolutionPile[positionInOrder,7])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 44://Blizzard Frost Beam Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 5] = 0
								scr_pay_momentum(3)
								scr_give_choice(5, "To Monster", "To Opponent")
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								switch(resolutionPile[positionInOrder, 5]){
									case 0:
										resolutionPile[positionInOrder, 6] = 0
										resolutionPile[positionInOrder, 7] = 0
										scr_target_field("all", "all", 0, 0, "any", "any", -1, 6)
										resolutionPile[positionInOrder,2]++
									break;
									case 1:
										scr_burn(obj_opponent,5,cardNum);
										resolutionPile[positionInOrder,2] = 98
									break;
								}
							break;
							case 5:
								scr_damage_card(resolutionPile[positionInOrder,7], resolutionPile[positionInOrder,6], 7)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 47://Igloo Castle Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 7, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						if(fieldCard[position] != noone){fieldCard[position].opt_used = true}
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;		
		case 48://Igloo Citadel Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						for(i = 0; i < 5; i++){
							if(scr_check_archetype(player.field[i], 4)){
								fieldCard[position].cardStat[4] = true		
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 49://Igloo Kingdom Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_recruit(34, 0, resolutionPile[positionInOrder,5]);
								resolutionPile[positionInOrder,2]++
							break;
							case 4:
								resolutionPile[positionInOrder,6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								resolutionPile[positionInOrder,2]++
							break;
							case 6:
								scr_recruit(34, 0, resolutionPile[positionInOrder,6]);
								resolutionPile[positionInOrder,2]++
							break;

						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						if(fieldCard[position] != noone){fieldCard[position].opt_used = true}
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 51://At long Last... Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,6] = handCount;
								for(var i = 0; i < handCount; i++){
									scr_discard(i);
								}
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_draw(resolutionPile[positionInOrder,6], true)
								scr_give_player_stats(resolutionPile[positionInOrder,6], 0, 0, 0, resolutionPile[positionInOrder,6])
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 52://Centrifugal Rebirth Effect 
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 5] = 0
								scr_target_infirmary(player, 14.1, 0);
								resolutionPile[positionInOrder, 2]++
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6)
								resolutionPile[positionInOrder, 2]++
							break;
							case 5:
								scr_give_player_stats(player, 0, 0, 0, -macros.origStat[obj_player.infirmary[resolutionPile[positionInOrder, 5],0]])
								scr_summon_from_infirmary(resolutionPile[positionInOrder, 5], resolutionPile[positionInOrder, 6])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 53://Healing Lullaby Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_give_player_stats(player, 0, momentum*2, 0, -momentum);
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 54://Battle Medic Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 15, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_recover_infirmary(player, resolutionPile[positionInOrder,5]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 55://Garbage Collector Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_buff_card(player, position, 0, 1, 0, 0, 0, 0, 0);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 56://Earthquake Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						for(var i = 0; i < 5; i++){
							if(obj_player.field[i] != 0){
								scr_bounce(obj_player, i);
								scr_give_player_stats(obj_player, 0, 0, 0, 3)
							}
							if(obj_opponent.field[i] != 0){
								scr_bounce(obj_opponent, i);
								scr_give_player_stats(obj_opponent, 0, 0, 0, 3)								
							}
						}
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 57://Power Discharge Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_hand(-1, 5, -1);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder,5])
								if(obj_player.playerHP >= 5){
									for(var i = 0; i < 5; i++){
										scr_destroy(player, i, 1)
										scr_destroy(opponent, i, 1)
									}
									resolutionPile[positionInOrder,2] = 98
									break;
								}
								resolutionPile[positionInOrder,6] = 0
								resolutionPile[positionInOrder,7] = 0
								scr_target_field("all", "all", 0, 5, "any", "any", -1, 6)
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_destroy(resolutionPile[positionInOrder,7], resolutionPile[positionInOrder,6], 1)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 58://Man with A Shield Effect 
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_recruit(59, 0, resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 60://The Great Leader Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_hand(-1, 5, -1);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,6] = 0;
								scr_choose_field_zones(true, false, false, true, false, 6)
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_recruit(61, 0, resolutionPile[positionInOrder,6])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 61://Bodyguard Effect
			switch(effectNum){
				case 0://Summon
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						for (var i=0;i<5;i++){
							if(player.field[i,0]==60){
								player.fieldCard[i].cardStatus[4] = true;
								scr_message_field_card_stats(i);
							}
						}						
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1://Destruction
					if(!effectSilenced){				
						if(!scr_if_you_control(61)){
							for (var i=0;i<5;i++){
								if(player.field[i,0]==60){
									player.fieldCard[i].cardStatus[4] = false;
									scr_message_field_card_stats(i);
								}
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;				
			}		
		break;		
		case 62://Awoken Civillian Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_recruit(63, 0, resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 63://Rebellion Ally Effect
			switch(effectNum){
				case 0://Summon
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						for (var i=0;i<5;i++){
							if(player.field[i,0]==62){
								scr_buff_card(player, i, 0, 0, 3, 3, 0, 0, 0)
								scr_message_field_card_stats(i);
							}
						}						
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1://Destruction
					if(!effectSilenced){				
						for (var i=0;i<5;i++){
							if(player.field[i,0]==62){
								scr_buff_card(player, i, 0, 3, 0, 0, 0, 0, 0)
								scr_message_field_card_stats(i);
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;						
			}		
		break;
		case 64://Lunar Tank Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_burn(opponent, 6, 64)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 65://Homesick Soldier
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_spin(player, position)
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 66://Bloodthirst Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_pay_momentum(3);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("all", "all", 0, 13, [1, 4], "any", -1, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, 4, 0, 0, 0, 0, 0)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 67://Pan Fighter Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_give_player_stats(player, 0, 3, 0, 0);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 68://Machine Gun Soldiers Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						for(var i = 0; i < player.field_zone_count; i++){
							if(opponent.field[i]){
								scr_damage_card(opponent, i, 1);
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 69://Speed Soldier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_draw(1, true)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 70://Vengeful Cyborg Effect
			switch(effectNum){
				case 0://Summon Self Paralyze
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						fieldCard[position].cardStatus[9] = true;
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1://Momentum Gain
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						//TODO: Activation Trigger Has To Save Damage
						scr_give_player_stats(player, 0, 0, 0, resolutionPile[positionInOrder,5])
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 71://Armed Civillian Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("all", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_damage_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 72://Torch Carrier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_mill_from_top(3)
								resolutionPile[positionInOrder,2]++
							break;
							case 2:
								scr_buff_card(player, position, 0, 1, 0, 0, 0, 0, 0);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 73://Baby Phoenix Effect TODO: Infirmary Effect Activation Function
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								if(player.mana < 2){
									resolutionPile[positionInOrder,2] = 97
									break;
								}
								resolutionPile[positionInOrder,2]++
							break;
							case 2:
								scr_give_player_stats(player, 0, 0, -2, 0);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 74://Useless Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						fieldCard[position].cardStatus[13] = true;
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 75://Wealthy Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_draw(1);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 76://Ruthless Sacrifice Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("opponent", "all", 0, 5, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_destroy(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1)
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;		
		case 77://Cursed Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 5] = 0
								scr_target_infirmary(player, 16, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6)
								resolutionPile[positionInOrder,2]++
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 78://Genesis Notebook Effect TODO: Complete, add Filter
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								if(!scr_if_you_control_filter(17)) {
									resolutionPile[positionInOrder,2] = 97
								}
								resolutionPile[positionInOrder,2]++
							break;
							case 2:
								resolutionPile[positionInOrder,5] = 0;
								scr_target_deck(16, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 4:
								scr_search(resolutionPile[positionInOrder,5]);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 79://Gathering of the Accursed Effect TODO: Choice
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						var lowestLevel = 0;
						for(var i = 0; i < player.field_zone_count; i++){
							if(player.field[i,0] && scr_check_archetype(player.field[i,0], 7) && (lowestLevel == 0 || lowestLevel > player.fieldCard[i].cardStat[0])){
								lowestLevel = player.fieldCard[i].cardStat[0]
							}
						}
						scr_give_player_stats(player, 0, 0, lowestLevel, 0);
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 80://Silent Courage Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("player", "all", 0, 13, "any", 7, -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]].cardStatus[0] = true;
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 81://Nightmare Beast- Crystal Echo Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0;
								scr_target_field("opponent", "any", 0, 5, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								var reflectedMonster = resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]];
								resolutionPile[positionInOrder,7] = reflectedMonster.cardStat[1];
								resolutionPile[positionInOrder,8] = reflectedMonster.cardStat[3];
								reflectedMonster.cardStatus[7] = true
								resolutionPile[positionInOrder,9] = 0;
								scr_choose_field_zones(true, false, false, true, false, 9)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								with(scr_recruit(116, 0, resolutionPile[positionInOrder,9])){
									cardStat[1] = resolutionPile[positionInOrder,7]
									cardStat[2] = resolutionPile[positionInOrder,8]
									cardStat[3] = resolutionPile[positionInOrder,8]
								}
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 82://Nightmare Beast Conductrons Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						for(i = 0; i < player.field_zone_count; i++){
							if(opponent.field[i,0]){
								scr_buff_card(opponent, i, 0, -1, -1, -1, 0, 0, 0)
								scr_buff_card(player, position, 0, 2, 2, 2, 0, 0, 0)
							}
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 83://Fisherman Rookie Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_recruit(84, 0, resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 85://Wise Fisherman Effect TODO: RNG Output
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 87://Lucky Fisherman Effect TODO: Rng Output
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 88://Strong Fisherman Effect TODO: Rng Output
			switch(effectNum){
				case 0://Recruit Fish
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
				case 1://ATK Gain
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 89://Naive Fisherman Effect TODO:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 90://Fisherman of the Options Effect TODO: Rng Output
			switch(effectNum){
				case 0://Recruit Fish
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
				case 1://Stat Gain
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 91://Lucky Reel Effect TODO:
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 92://Cursed Reel Effect TODO:
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 93://Marketplace of Seas Effect TODO: Decision?
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 94://Highest Bidder Effect TODO: Decision
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 96://Fullteam Medics Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
						scr_give_player_stats(player, 0, 6, 0, 0)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 99://Single Shot Master Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("all", "all", 0, 13, "any", "any", -1, 5);
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_destroy(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 100://Desperate Power Measures Effect TODO: Discard?
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_hand(-1, 5, position)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder, 5])
								scr_give_player_stats(player, 0, 0, 0, 3);
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 101://Rogue Soldier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_hand(9, 5, position)
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder, 5])
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 107://Casey X-Makine Cannons Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
					
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 108://Theo X-Makine Cannons Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
					
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 109://Lily, X-Makine Carrier Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 110://Robert, X-Makine Wheels Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 111://Dom X-Makine Airforce Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 112://Casey, DX-Makine Thundermech Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 113://Emergency Call Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 114://Mighty Changing Fire Blades TODO: Complete
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 115://X-Makines Form Together! Effect TODO: Complete
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 116://Reflection Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_burn(player, 3, cardNum)
						scr_burn(opponent, 3, cardNum)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
	}

}
/*
		case CARDNUM://CARDNAME Effect TODO:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){				
					
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;

		case CARDNUM://CARDNAME Effect TODO:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[11] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,2]++
							break;
							case 3:
								resolutionPile[positionInOrder,2] = 98
							break;
						}
					}else{
						resolutionPile[positionInOrder,2] = 98
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
*/