function scr_resolve_effect_in_pile(positionInOrder){
	var cardNum = resolutionPile[positionInOrder, 0],
	effectNum = resolutionPile[positionInOrder, 1],
	resolutionStep = resolutionPile[positionInOrder, 2],
	position = resolutionPile[positionInOrder, 3],
	effectSilenced = resolutionPile[positionInOrder,4];
	
	switch(cardNum){
		case "WheelGain"://Visclades Wheel Gain
			switch(effectNum){
				case 2:
					if(!effectSilenced){
						scr_give_player_stats(player, 0, 0, 0, resolutionPile[positionInOrder, 5])
					}
					resolutionPile[positionInOrder,2] = 99;
				break;
			}			
		break;
		case "SharedEffects":
			switch(effectNum){
				case SharedVisclades:
					if(!effectSilenced){
						scr_give_player_stats(player, 0, 0, 1, 0)
						wheel_locked = true;
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
				case SharedUnderworldVisclades:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 5, 5);
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,6] = -1
								scr_choose_field_zones(true, false, false, true, false, 6);
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;			
			}
		break;
		case 1://Motorbiker Showman Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						scr_give_player_stats(obj_player, 0, 0, 0, 1);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}				
		break;
		case 2://Motorbiker Doppelganger Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = -1
								scr_choose_field_zones(true, false, false, true, false, 5);
								NextStep
							break;
							case 3:
								scr_summon_from_deck_name(2, resolutionPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if(field[i,0]> 0){
								if(scr_check_archetype(field[i,0], ArcMotorbiker)){
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if(field[i,0]> 0){
								if(scr_check_archetype(field[i,0], ArcMotorbiker)){
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						cardcan_attack = true;
						cardStatus[StatusCantAttackDirect] = false;			
					}
					scr_message_field_card_stats(position)	
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		
		case 7://Motorbiker Protector Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						for(var i=0; i < 5; i++){
							if(field[i,0]> 0){
								if(scr_check_archetype(field[i,0], ArcMotorbiker)){
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
								NextStep
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder,5])
								scr_give_player_stats(player, 0, 0, 0, 3)
								wheel_locked = true;
								NextStep
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						NextStep
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,6] = 0
								scr_target_momentum_deck(3,6);
								scr_voidfy_infirmary(obj_player, resolutionPile[positionInOrder,5]);
								NextStep
							break;
							case 4:
								resolutionPile[positionInOrder,7] = 0
								scr_choose_field_zones(true, false, false, false, true, 7);
								NextStep
							break;
							case 6:
								scr_summon_momentum_deck(positionInOrder, resolutionPile[positionInOrder,7]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
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
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_damage_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5] ,player.fieldCard[position].cardStat[StatATK])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						with(player.fieldCard[position]){
							cardStat[StatHP] = round(cardStat[StatHP]/2);
							scr_buff_card(player, position, 0, 4, 0, 0, 0, 0, 0);					
						}
					}
				break;
			}
		break;
		case 14://Motorbiker Leader Luther Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, -2, 0, 0, 0, 0, 0)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						scr_burn(opponent,2,15);
					}
				break;
			}
		break;
		case 16://EoS Embodiment of Speed Effect
			switch(!fieldCard[position].cardStatus[StatusSilenced] && effectNum){
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
									absorbCount += cardStat[StatATK]-1;
									absorbCount += cardStat[StatHP]-1;
									cardStat[StatATK] = 1;
									cardStat[StatMaxHP] = 1;
									cardStat[StatHP] = 1;
									scr_message_opponent_field_card_stats(position)
								}
								scr_buff_card(player, position, 0, absorbCount, 0, 0, 0, 0, 0)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						with(player){scr_draw(1, true)}				
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 19://Idine Lib Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder, 6] = scr_find_infirmary(opponent, resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder, 7] = opponent.infirmary[resolutionPile[positionInOrder,6],1]
								with(opponent){
									scr_remove_from_infirmary(resolutionPile[positionInOrder,6]);
								}
								NextStep
								
							break;
							case 2:
								resolutionPile[positionInOrder, 8] = 0
								scr_choose_field_zones(true, false, false, true, true, 8);
								NextStep
							break;
							case 4:
								with(scr_summon(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder, 7], player, "effect", "opponentInfirmaryToField", resolutionPile[positionInOrder, 8])){
									scr_silence(player, self.position);
									cardStatus[StatusParalyzed] = true;
									if(player == obj_player){
										scr_message_field_card_stats(position);
									}else if(player == obj_opponent){
										scr_message_opponent_field_card_stats(position);
									}
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						scr_spin(player, position);
					}
					resolutionPile[positionInOrder,2] = 99					
				break;
			}
		break;
		case 21://Luvies Ing Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
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
								NextStep
							break;
							case 3:
								
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, 0, 2, 2, 0, 0, 0)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0; //player
								scr_target_field("all", "all", 0, 13, "any", "any", -1, 5)
								resolutionPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_copy_stats(resolutionPile[positionInOrder,6], fieldCard[resolutionPile[positionInOrder,5]], false, true, true, true, false, false, false)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
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
					if(!effectSilenced && scr_count_infirmary_filter(obj_player, 4, "any") >= 4){
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
										cardStatus[StatusSelfDestruct] = true;
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								resolutionPile[positionInOrder, 2]++							
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								scr_mill(resolutionPile[positionInOrder,5])
								NextStep
							break;
							case 4:
								resolutionPile[positionInOrder,6] = 0
								resolutionPile[positionInOrder,7] = 0
								scr_target_field("player", "all", 0, 13, "any", 3, -1, 6)
								NextStep
							break;
							case 6:
								scr_buff_card(resolutionPile[positionInOrder,7], resolutionPile[positionInOrder,6], 0, 2, 0, 0, 0, 0, 0)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5)
								NextStep
							break;
							case 3:
								scr_silence(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						scr_give_player_stats(player, 0, mana*3, -mana, 0)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}			
		break;
		case 30://Visclades Depression Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						for(var i = 0; i < 5; i++){
							if(obj_opponent.field[i,0] > 0){
								if(!obj_opponent.fieldCard[i].cardStatus[StatusImmune]){
									obj_opponent.fieldCard[i].cardStatus[StatusUnarmed] = true;
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						var visclades=0;
						for (i = 0; i < obj_player.infirmaryCount; i++){
							if(scr_check_archetype(obj_player.infirmary[i,0], ArcVisclades)){
								visclades++
							}
						}
						scr_buff_card(player, position, 0, visclades, visclades, visclades, 0, 0, 0);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						fieldCard[position].cardStatus[StatusIndestructable] = false;
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 33://Pole Clan Builder Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = -1
								scr_choose_field_zones(true, false, false, true, false, 5);
								NextStep
							break;
							case 3:
								scr_summon_from_deck_name(32, resolutionPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						scr_burn(opponent, 3, cardNum)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 35://Pole Clan Mage Effect
			switch(effectNum){
				case 0:
							
					if(scr_if_you_control_filter(6) && !fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_deck(8, 5)
								NextStep
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						for(i = 0; i < 5; i++){
							scr_buff_card(player, i, 0, 0, 0, 0, 0, 0, 1)
						}
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
					if(scr_if_you_control_filter(6) && !fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						scr_buff_card(player, position, 0, 3, 2, 2, 0, 0, 0)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 38://Pole Clan Torch Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0 //player
								scr_target_field("all", "all", 0, 13, "any", 5, -1, 5)
								NextStep
							break;
							case 5:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, 0, 5, 5, 0, 0, 0)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0 //player
								scr_target_field("all", "all", 0, 13, "any", 5, -1, 5)
								NextStep
							break;
							case 5:
								scr_burn(obj_opponent, resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]].cardStat[StatATK], cardNum)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,6].resolutionPile[positionInOrder,5].cardStatus[StatusParalyzed] = true
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder, 5])
								resolutionPile[positionInOrder,7] = 0
								resolutionPile[positionInOrder,8] = 0
								scr_target_field("opponent", "all", 0, macros.origStat[resolutionPile[positionInOrder,6], StatLevel], "any", "any",-1, 7)
								NextStep
							break;
							case 5:
								scr_silence(resolutionPile[positionInOrder,8], resolutionPile[positionInOrder,7])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								scr_pay_momentum(3)
								NextStep
							break;
							case 3:
								var choiceArray = []
								if(scr_count_field(opponent) != 0){
									array_push(choiceArray, [0, "To Player"])
								}
								array_push(choiceArray, [1, "To Opponent"])
								resolutionPile[positionInOrder, 5] = 0
								scr_give_choice(5, choiceArray)
								NextStep
							break;
							case 5:
								switch(resolutionPile[positionInOrder, 5]){
									case 0:
										resolutionPile[positionInOrder, 6] = 0
										resolutionPile[positionInOrder, 7] = 0
										scr_target_field("all", "all", 0, 0, "any", "any", -1, 6)
										NextStep
									break;
									case 1:
										scr_burn(obj_opponent, 5, cardNum);
										FinishResolving
									break;
								}
							break;
							case 7:
								scr_damage_card(resolutionPile[positionInOrder,7], resolutionPile[positionInOrder,6], 7)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 7, 5)
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder, 6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						for(i = 0; i < 5; i++){
							if(scr_check_archetype(player.field[i], ArcPoleClan)){
								fieldCard[position].cardStat[StatArmor] += 1;
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5);
								NextStep
							break;
							case 3:
								scr_recruit(34, 0, resolutionPile[positionInOrder,5]);
								NextStep
							break;
							case 4:
								resolutionPile[positionInOrder,6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6);
								NextStep
							break;
							case 6:
								scr_recruit(34, 0, resolutionPile[positionInOrder,6]);
								NextStep
							break;

						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								scr_draw(resolutionPile[positionInOrder,6], true)
								scr_give_player_stats(resolutionPile[positionInOrder,6], 0, 0, 0, resolutionPile[positionInOrder,6])
							break;
						}
					}else{
						FinishResolving
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
								scr_give_player_stats(player, 0, 0, 0, -macros.origStat[obj_player.infirmary[resolutionPile[positionInOrder, 5],0], StatLevel])
								scr_summon_from_infirmary(resolutionPile[positionInOrder, 5], resolutionPile[positionInOrder, 6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_infirmary(player, 15, 5);
								NextStep
							break;
							case 3:
								scr_recover_infirmary(player, resolutionPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
								NextStep
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder,5])
								if(obj_player.playerHP >= 5){
									for(var i = 0; i < 5; i++){
										scr_destroy(player, i, 1)
										scr_destroy(opponent, i, 1)
									}
									FinishResolving
									break;
								}
								resolutionPile[positionInOrder,6] = 0
								resolutionPile[positionInOrder,7] = 0
								scr_target_field("all", "all", 0, 5, "any", "any", -1, 6)
								NextStep
							break;
							case 5:
								scr_destroy(resolutionPile[positionInOrder,7], resolutionPile[positionInOrder,6], 1)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5)
								NextStep
							break;
							case 3:
								scr_recruit(59, 0, resolutionPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_hand(-1, 5, -1);
								NextStep
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder,5])
								resolutionPile[positionInOrder,6] = 0;
								scr_choose_field_zones(true, false, false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_recruit(61, 0, resolutionPile[positionInOrder,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						for (var i=0;i<5;i++){
							if(player.field[i,0]==60){
								player.fieldCard[i].cardStatus[StatusIndestructable] = true;
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
									player.fieldCard[i].cardStatus[StatusIndestructable] = false;
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5)
								NextStep
							break;
							case 3:
								scr_recruit(63, 0, resolutionPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						scr_burn(opponent, 6, 64)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 65://Homesick Soldier
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("all", "all", 0, 13, [1, 4], "any", -1, 5);
								NextStep
							break;
							case 5:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 0, 4, 0, 0, 0, 0, 0)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						scr_draw(1, true)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 70://Vengeful Cyborg Effect
			switch(effectNum){
				case 0://Summon Self Paralyze
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						fieldCard[position].cardStatus[StatusParalyzed] = true;
					}
					resolutionPile[positionInOrder,2] = 99
				break;
				case 1://Momentum Gain
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("all", "all", 0, 13, "any", "any", -1, 5)
								NextStep
							break;
							case 3:
								scr_damage_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_mill_from_top(3)
								NextStep
							break;
							case 2:
								scr_buff_card(player, position, 0, 1, 0, 0, 0, 0, 0);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 2:
								scr_give_player_stats(player, 0, 0, -2, 0);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						fieldCard[position].cardStatus[StatusSelfDestruct] = true;
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 75://Wealthy Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_draw(1, true);
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 76://Ruthless Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("opponent", "all", 0, 5, "any", "any", -1, 5)
								NextStep
							break;
							case 3:
								scr_destroy(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 78://Genesis Notebook Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								if(!scr_if_you_control_filter(17)) {
									resolutionPile[positionInOrder,2] = 97
								}
								NextStep
							break;
							case 2:
								resolutionPile[positionInOrder,5] = 0;
								scr_target_deck(16, 5)
								NextStep
							break;
							case 4:
								scr_search(resolutionPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 79://Gathering of the Accursed Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						var lowestLevel = 0;
						for(var i = 0; i < player.field_zone_count; i++){
							if(player.field[i,0] && scr_check_archetype(player.field[i,0], ArcSacrifice) && (lowestLevel == 0 || lowestLevel > player.fieldCard[i].cardStat[StatLevel])){
								lowestLevel = player.fieldCard[i].cardStat[StatLevel]
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
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]].cardStatus[StatusTAUNT] = true;
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								resolutionPile[positionInOrder,6] = 0;
								scr_target_field("opponent", "any", 0, 5, "any", "any", -1, 5)
								NextStep
							break;
							case 3:
								var reflectedMonster = resolutionPile[positionInOrder,6].fieldCard[resolutionPile[positionInOrder,5]];
								resolutionPile[positionInOrder,7] = reflectedMonster.cardStat[StatATK];
								resolutionPile[positionInOrder,8] = reflectedMonster.cardStat[StatHP];
								reflectedMonster.cardStatus[StatusUnarmed] = true
								resolutionPile[positionInOrder,9] = 0;
								scr_choose_field_zones(true, false, false, true, false, 9)
								NextStep
							break;
							case 5:
								with(scr_recruit(116, 0, resolutionPile[positionInOrder,9])){
									cardStat[StatATK] = resolutionPile[positionInOrder,7]
									cardStat[StatMaxHP] = resolutionPile[positionInOrder,8]
									cardStat[StatHP] = resolutionPile[positionInOrder,8]
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_choose_field_zones(true, false, false, true, false, 5)
								NextStep
							break;
							case 3:
								scr_recruit(84, 0, resolutionPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 85://Wise Fisherman Effect 
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolutionPile[resolutionStep,5]
								resolutionPile[resolutionStep,6] = 84 //Fish to Summon
								resolutionPile[resolutionStep,7] = 0
																
								if(randomResult < 10){
									FinishResolving
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones(true, false, false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 98){
									scr_choose_field_zones(true, false, false, true, false, 7);
									resolutionPile[resolutionStep,2] = 6;
									break;
								}
								resolutionPile[resolutionStep,6] = 86 //Goldfish
								scr_choose_field_zones(true, false, false, true, false, 7);
								NextStep
							break;
							case 5:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								resolutionPile[resolutionStep,5] = 10
								resolutionPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						player.fieldCard[position].opt_used = true
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 87://Lucky Fisherman Effect 
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolutionPile[resolutionStep,5]
								resolutionPile[resolutionStep,6] = 84 //Fish to Summon
								resolutionPile[resolutionStep,7] = 0
								
								if(randomResult < 40){
									scr_destroy(player, position, 1)
									FinishResolving
									break;
								}
								if(randomResult < 60){
									scr_choose_field_zones(true, false, false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 95){
									scr_choose_field_zones(true, false, false, true, false, 7);
									resolutionPile[resolutionStep,2] = 6;
									break;
								}
								resolutionPile[resolutionStep,6] = 86//Goldfish
								scr_choose_field_zones(true, false, false, true, false, 7);
								NextStep
							break;
							case 5:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								resolutionPile[resolutionStep,5] = 40								
								resolutionPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						player.fieldCard[position].opt_used = true
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 88://Strong Fisherman Effect 
			switch(effectNum){
				case 0://Recruit Fish
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolutionPile[resolutionStep,5]
								resolutionPile[resolutionStep,6] = 84 //Fish to Summon
								resolutionPile[resolutionStep,7] = 0
								
								if(randomResult < 10){
									FinishResolving
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones(true, false, false, true, false, 7);
									NextStep
									break;
								}
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 7);
								resolutionPile[resolutionStep,2] = 6
							break;
							case 5:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_destroy(resolutionPile[resolutionStep,8], resolutionPile[resolutionStep,7], 1)
								resolutionPile[resolutionStep,5] = 10								
								resolutionPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						player.fieldCard[position].opt_used = true
						resolutionPile[positionInOrder,2] = 99
					}
				break;
				case 1://ATK Gain
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						scr_buff_card(player, position, 0, 1, 0, 0, 0, 0, 0)
						FinishResolving
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 89://Naive Fisherman Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolutionPile[resolutionStep,5]
								resolutionPile[resolutionStep,6] = 84 //Fish to Summon
								resolutionPile[resolutionStep,7] = 0
								
								if(randomResult < 10){
									for(var i = 0; i < player.field_zone_count; i++){
										if(scr_check_archetype(player.field[i,0], ArcFish)){
											player.fieldCard[i].cardStatus[StatusUnarmed] = true
										}
									}									
									FinishResolving
									break;
								}
								if(randomResult < 30){
									scr_choose_field_zones(true, false, false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones(true, false, false, true, false, 7);
									resolutionPile[resolutionStep,2] = 6;
									break;
								}
								resolutionPile[resolutionStep,6] = 86 //Goldfish
								scr_choose_field_zones(true, false, false, true, false, 7);
								resolutionPile[resolutionStep,2] = 8;
							break;
							case 5:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								with(scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])){
									cardStatus[StatusUnarmed] = true;
								}
								scr_choose_field_zones(true, false, false, true, false, 7);
								NextStep
							break;
							case 9:
								with(scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])){
									cardStatus[StatusUnarmed] = true;
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						player.fieldCard[position].opt_used = true
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 90://Fisherman of the Oceans Effect 
			switch(effectNum){
				case 0://Recruit Fish
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolutionPile[resolutionStep,5]
								resolutionPile[resolutionStep,6] = 84 //Fish to Summon
								resolutionPile[resolutionStep,7] = 0
								
								if(randomResult < 30){
									scr_choose_field_zones(true, false, false, true, false, 7);
									resolutionPile[resolutionStep, 2] = 8
									break;
								}
								if(randomResult < 80){
									scr_target_infirmary(player, 21.1, 7)
									resolutionPile[resolutionStep, 2] = 10
									break;
								}
								if(randomResult < 95){
									scr_choose_field_zones(true, false, false, true, false, 7);
									NextStep
									break;								
								}
								resolutionPile[resolutionStep,6] = 86
								scr_choose_field_zones(true, false, false, true, false, 7);
								resolutionPile[resolutionStep, 2] = 8
							break;
							case 5:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								scr_choose_field_zones(true, false, false, true, false, 7);
								NextStep
							break;
							case 7:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								scr_choose_field_zones(true, false, false, true, false, 7);
								NextStep
							break;
							case 9:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								scr_choose_field_zones(true, false, false, true, false, 7);
								FinishResolving
							break;
							case 11:
								scr_choose_field_zones(true, false, false, true, false, 8);
								NextStep
							break;
							case 13:
								scr_summon_from_infirmary(resolutionPile[resolutionStep,7], resolutionPile[resolutionStep,8])
								scr_choose_field_zones(true, false, false, true, false, 7);
								resolutionPile[resolutionStep, 2] = 8							
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
				case 1://Stat Gain
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						var foishi = resolutionPile[resolutionStep, 5]
						scr_buff_card(player, position, 0, macros.origStat[foishi, StatATK], macros.origStat[foishi, StatMaxHP], macros.origStat[foishi, StatMaxHP], 0, 0, 0);
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 91://Lucky Reel Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolutionPile[resolutionStep,5]
								resolutionPile[resolutionStep,6] = 84 //Fish to Summon
								resolutionPile[resolutionStep,7] = 0
																
								if(randomResult < 10){
									FinishResolving
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones(true, false, false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 98){
									scr_choose_field_zones(true, false, false, true, false, 7);
									resolutionPile[resolutionStep,2] = 6;
									break;
								}
								resolutionPile[resolutionStep,6] = 86 //Goldfish
								scr_choose_field_zones(true, false, false, true, false, 7);
								NextStep
							break;
							case 5:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_recruit(resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,7])
								resolutionPile[resolutionStep,5] = 10
								resolutionPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 92://Cursed Reel Effect 
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = scr_pay_momentum(obj_player.momentum);
								NextStep
							break;
							case 2:
								if(!resolutionPile[positionInOrder,5]){
									FinishResolving
									break;
								}
								resolutionPile[positionInOrder,6] = irandom(100)
								NextStep
								NextStep//Add this to the animation
							break;
							case 4:
								var randomResult = resolutionPile[resolutionStep,6]
								resolutionPile[resolutionStep,7] = 84 //Fish to Summon
								resolutionPile[resolutionStep,8] = 0
																
								if(randomResult < 80){
									FinishResolving
									break;
								}
								if(randomResult < 95){
									scr_choose_field_zones(true, false, false, true, false, 8);
									NextStep
									break;
								}
								resolutionPile[resolutionStep,7] = 86 //Goldfish
								scr_choose_field_zones(true, false, false, true, false, 8);
								NextStep
							break;
							case 6:
								scr_recruit(resolutionPile[resolutionStep,7], 0, resolutionPile[resolutionStep,8])
								resolutionPile[resolutionStep,2] = 2
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 93://Marketplace of Seas Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								var choiceArray = []
								if(scr_count_infirmary_name(84, cardNum, "any") >= 5){
									array_push(choiceArray, [0, "Voidfy Fishes"])
								}
								if(scr_count_infirmary_name(86, cardNum, "any") != 0){
									array_push(choiceArray, [1, "Voidfy Goldfish"])
								}
								resolutionPile[positionInOrder, 5] = 0
								scr_give_choice(5, choiceArray)
								NextStep
							break;
							case 3:
								var choice = resolutionPile[positionInOrder, 5];
								resolutionPile[positionInOrder, 6] = 0; //Voidfy Count
								resolutionPile[positionInOrder, 7] = 0;
								
								if(choice){
									if(resolutionPile[positionInOrder, 6]){
										resolutionPile[positionInOrder, 2] = 6
										break;
									}
									scr_target_infirmary_name(player, 86, 7)
									NextStep
									break;
								}
								if(resolutionPile[positionInOrder, 6] == 5){
									resolutionPile[positionInOrder, 2] = 6									
									break;	
								}
								scr_target_infirmary_name(player, 84, 7)
								NextStep
							break;
							case 5:
								scr_voidfy_infirmary(player, resolutionPile[positionInOrder, 7])
								resolutionPile[positionInOrder, 6]++
								resolutionPile[positionInOrder, 2] = 3
							break;
							case 6:
								scr_give_player_stats(player, 0, 0, 3, 0);
								scr_draw(1, true);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 94://Highest Bidder Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								scr_target_infirmary_name(player, 86, 5)
								NextStep
							break;
							case 3:
								scr_voidfy_infirmary(player, resolutionPile[positionInOrder,5]);
								scr_draw(2, true);
								resolutionPile[positionInOrder,6] = 0
								scr_target_deck(21, 6);
								NextStep
							break;
							case 5:
								scr_search(resolutionPile[positionInOrder,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
						scr_give_player_stats(player, 0, 6, 0, 0)
					}
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 99://Single Shot Master Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("all", "all", 0, 13, "any", "any", -1, 5);
								NextStep
							break;
							case 3:
								scr_destroy(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 100://Desperate Power Measures Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_hand(18, 5, position)
								NextStep
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder, 5])
								scr_give_player_stats(player, 0, 0, 0, 3);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_hand(9, 5, position)
								NextStep
							break;
							case 3:
								scr_discard(resolutionPile[positionInOrder, 5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 107://Casey X-Makine Cannons Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced && player.momentum <= 3){
						switch(resolutionStep){
							case 1:
								for(var i = 0; i < player.field_zone_count; i++){
									if(i != position && scr_check_archetype(player.field[i], ArcXMakine)){
										scr_buff_card(player, i, 0, 1, 0, 0, 0 ,0 ,0);
										resolutionPile[positionInOrder,2] = 2
									}
								}
								NextStep
							break;
							case 2:
								FinishResolving
							break;
							case 3:
								scr_give_player_stats(player, 0, 0, 0, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}
				break;
			}		
		break;
		case 108://Theo X-Makine Cannons Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced && player.momentum <= 3){
						switch(resolutionStep){
							case 1:
								for(var i = 0; i < player.field_zone_count; i++){
									if(i != position && scr_check_archetype(player.field[i], ArcXMakine)){
										scr_buff_card(player, i, 0, 0, 1, 1, 0 ,0 ,0);
										resolutionPile[positionInOrder,2] = 2
									}
								}
								NextStep
							break;
							case 2:
								FinishResolving
							break;
							case 3:
								scr_give_player_stats(player, 0, 0, 0, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}
				break;
			}		
		break;
		case 109://Lily, X-Makine Carrier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced && player.momentum == 0){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								scr_target_deck(19, 5)
								NextStep
							break;
							case 3:
								scr_search(resolutionPile[positionInOrder]);
								scr_give_player_stats(player, 0, 0, 0, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}
				break;
			}
		break;
		case 110://Robert, X-Makine Wheels Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced && player.momentum <= 3){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0;
								scr_target_infirmary(player, 19, 5)
								NextStep
							break;
							case 3:
								scr_recover_infirmary(player, resolutionPile[positionInOrder]);
								scr_give_player_stats(player, 0, 0, 0, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}
				break;
			}
		break;
		case 111://Dom X-Makine Airforce Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced && player.momentum <= 3){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field(player, "all", 0, 12, "any", 11, position, 5)
								NextStep
							break;
							case 3:
								scr_buff_card(resolutionPile[positionInOrder,6], resolutionPile[positionInOrder,5], 1, 0, 0, 0, 0, 0, 0)
								scr_draw(1, true)
								scr_give_player_stats(player, 0, 0, 0, 4)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
						player.fieldCard[position].opt_used = true
					}
				break;
			}
		break;
		case 112://Jason, DX-Makine Thundermech Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								resolutionPile[positionInOrder,6] = 0
								scr_target_field("opponent", "all", 0, 13, "any", "any", -1, 5);
								NextStep
							break;
							case 3:
								if(player.momentum <= 6){
									scr_silence(resolutionPile[positionInOrder,6],resolutionPile[positionInOrder,5])
									scr_give_player_stats(player, 0, 0, 0, 6)
								}else{
									scr_damage_card(resolutionPile[positionInOrder,6],resolutionPile[positionInOrder,5], 8)
									scr_give_player_stats(player, 0, 0, 0, -6)
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 113://Emergency Call Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && scr_count_field_filter(player, 19, false) && scr_count_field(opponent)){
						switch(resolutionStep){
							case 1:
								resolutionPile[positionInOrder,5] = 0
								scr_target_deck(19.1, 5)
								NextStep
							break;
							case 3:
								resolutionPile[positionInOrder,6] = 0
								scr_choose_field_zones(true, false, false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_summon_from_deck(resolutionPile[positionInOrder,5], resolutionPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 114://Mighty Changing Fire Blades
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolutionPile[resolutionStep,5] = scr_pay_momentum(momentum);
								NextStep
							break;
							case 3:
								resolutionPile[resolutionStep,6] = 0;
								resolutionPile[resolutionStep,7] = 0;
								scr_target_field("player", "all", 0, 13, "any", ArcXMakine, -1, 6)
								NextStep
							break;
							case 5:
								if(resolutionPile[resolutionStep,5]){
									scr_buff_card(resolutionPile[resolutionStep,7], resolutionPile[resolutionStep,6], 0, resolutionPile[resolutionStep,5], 0, 0, 0, 0, 0)
								}else{
									resolutionPile[resolutionStep,6].fieldCard[resolutionPile[resolutionStep,7]].cardStatus[StatusTAUNT] = true;
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 115://X-Makines Form Together! Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && scr_count_field_filter(player, 19, false) && scr_count_field_filter(player, 20, false)){
						switch(resolutionStep){
							case 1:
								for(var i = 0; i < player.field_zone_count; i++){
									scr_destroy(player, i, 1);
								}
								NextStep
							break;
							case 3:
								resolutionPile[resolutionStep,5] = 0
								scr_target_momentum_deck(19.1, 5)
							break;
							case 5:
								resolutionPile[resolutionStep,6] = 0
								scr_choose_field_zones(true, false, false, false, true, 5)
								NextStep
							break;
							case 7:
								scr_summon_momentum_deck(resolutionPile[resolutionStep,5], resolutionPile[resolutionStep,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
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
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){				
					
					}
					scr_discard(position);
					resolutionPile[positionInOrder,2] = 99
				break;
			}		
		break;

		case CARDNUM://CARDNAME Effect TODO:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].cardStatus[StatusSilenced] && !effectSilenced){
						switch(resolutionStep){
							case 1:
								NextStep
							break;
							case 3:
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_discard(position);
						resolutionPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
*/