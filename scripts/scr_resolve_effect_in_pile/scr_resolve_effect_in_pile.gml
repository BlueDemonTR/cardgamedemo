function scr_resolve_effect_in_pile(positionInOrder){
	var cardNum = resolvingPile[positionInOrder, 0],
	effectNum = resolvingPile[positionInOrder, 1],
	resolutionStep = resolvingPile[positionInOrder, 2],
	//Gets the object's position if the variable is an object that has a position value
	position = variable_instance_exists(resolvingPile[positionInOrder, 3], "position") ? resolvingPile[positionInOrder, 3].position : resolvingPile[positionInOrder, 3],
	effectSilenced = resolvingPile[positionInOrder,4];
	
	switch(cardNum){
		case "Attack":
			var attacker = player.fieldCard[position],
			attacked = resolvingPile[positionInOrder,5];
			if(!(instance_exists(attacker) && instance_exists(attacked))){
				resolvingPile[positionInOrder,2] = 99
				break;
			}
			if(attacked.getStat(StatDodge) > 0){
				scr_increase_stat_card(attacked.player, attacked.position, StatDodge, -1);
				resolvingPile[positionInOrder,2] = 99
				break;
			}
			var damage = attacker.getStat(StatATK) - attacked.getStat(StatATK),
			excessDamage = damage - attacked.getStat(StatHP),
			counterAttack = attacked.getStat(StatATK) - attacker.getStat(StatATK);
			
			scr_damage_card(attacked.player, attacked.position, damage)

			if(!attacked.getStatus(StatusRanged)){
				scr_damage_card(attacker.player, attacker.position, counterAttack)
			}
			
			if(!instance_exists(attacked)){
				scr_destroys_by_battle(attacker, attacked.cardNum)	
			}
			
			if(attacker.getStatus(StatusPierce) && excessDamage > 0){
				scr_increase_stat_player(opponent, PlayerHP, -excessDamage)
				scr_on_pierce(attacker, attacked, damage)
			}
			with(attacker){
				scr_after_attack(attacker.cardNum, attacker, damage)
			}
			resolvingPile[positionInOrder,2] = 99
		break;
		case "DirectAttack":
			var attacker = player.fieldCard[position];
			if(!instance_exists(attacker)){
				resolvingPile[positionInOrder,2] = 99
				break;
			}
			var damage = attacker.getStat(StatATK);
			
			scr_increase_stat_player(opponent, PlayerHP, -damage)
			
			with(attacker){
				scr_after_attack(attacker.cardNum, attacker, damage)
				scr_after_direct_attack(attacker, damage)
			}
			resolvingPile[positionInOrder,2] = 99
		break;
		case "SelfDestruct"://Status Self Destruct Effect
			if(effectSilenced){break;}
			scr_destroy(player, position, 1);
			resolvingPile[positionInOrder,2] = 99
		break;
		case "Regeneration"://Stat Regeneration Effect
			if(effectSilenced){break;}
			scr_heal_card(player, position, 3);
			resolvingPile[positionInOrder,2] = 99
		break;
		case "Poison"://Status Poison Effect
			if(effectSilenced){break;}
			scr_damage_card(player, position, 1);
			resolvingPile[positionInOrder,2] = 99
		break;
		case "WheelGain":
			switch(position){
				case 1://Motorbiker Wheel Gain Effect
				case 2://Visclades Wheel Gain Effect
				case 3://Pole Clan Wheel Gain Effect
				case 4://Sacrifice Wheel Gain Effect
					if(!effectSilenced){
						scr_increase_stat_player(player, PlayerMomentum, resolvingPile[positionInOrder,5])
					}
					resolvingPile[positionInOrder,2] = 99;
				break;				
				case 5://Fisherman Wheel Gain Effect
					if(!effectSilenced){
						scr_increase_stat_player(player, PlayerMomentum, macros.origStat[resolvingPile[positionInOrder,5], StatLevel])
					}
					resolvingPile[positionInOrder,2] = 99;
				break;
				case 6://Classic Wheel v1.0 Gain Effect
					if(!effectSilenced){
						scr_increase_stat_player(player, PlayerMomentum, 3)
					}
					resolvingPile[positionInOrder,2] = 99;
				break;			
				case 7://X-Makine Heat Meter !Gain Effect
					if(!effectSilenced){
						scr_increase_stat_player(player, PlayerMomentum, -2)
					}
					resolvingPile[positionInOrder,2] = 99;
				break;
			}			
		break;
		case "WheelEffect":
			var wheelNum = position;
			switch(wheelNum){
				case 1://Motorbiker Wheel
					switch(effectNum){
						case 0:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3);
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_deck([player], [TypeMonster], 1, 12, [ArcMotorbiker], [], false, -1, 5)
										NextStep
									break;
									case 4:
										scr_search(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								wheel_opt[effectNum] = true
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = scr_target_deck_name(player, 9)
										NextStep
									break;
									case 3:
										scr_search(player, resolvingPile[positionInOrder, 5])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										for(var i = 0; i < player.field_zone_count; i++){
											if(player.field[i]){
												player.fieldCard[i].attacksLeft++
											}
										}
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								scr_lock_wheel(player)
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
				case 2://Visclades Wheel
					switch(effectNum){
						case 0:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3)
										NextStep
									break;
									case 2:
										scr_increase_stat_player(player, PlayerMana, 2)
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = scr_target_deck_name(player, 24)
										NextStep
									break;
									case 4:
										scr_search(player, resolvingPile[positionInOrder, 5])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_infirmary([player], [TypeMonster, TypeMomentum], 1, 12, [ArcVisclades], [], true, -1, -1, -1, 5)
									break;
									case 4:
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, true, false, 7)
									break;
									case 6:
										scr_summon_from_infirmary(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
				case 3://Pole Clan Wheel
					switch(effectNum){
						case 0:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										if(scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1, 5)){
											NextStep
											break;
										}
										resolvingPile[positionInOrder,2] = 5 //The effect has an alternative so we don't do next step here
									break;
									case 4:
										scr_heal_card(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5], 3)
										FinishResolving
									break;
									case 5:
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, true, false, 7)
										NextStep
									break;
									case 7:
										resolvingPile[positionInOrder, 8] = scr_target_deck_name(player, 32)
										NextStep
									break;
									case 8:
										scr_summon_from_deck(resolvingPile[positionInOrder, 8], resolvingPile[positionInOrder, 7])
										FinishResolving
									break
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = scr_target_deck_name(player, 35)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = 0
										scr_choose_field_zones([player], false, true, false, 6)
										NextStep
									break;
									case 6:
										scr_summon_from_deck(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1, 5)
										NextStep
									break;
									case 4:
										var affectedCard = resolvingPile[positionInOrder, 6].fieldCard[resolvingPile[positionInOrder, 5]]
										scr_heal_card(affectedCard.player, affectedCard.position, affectedCard.getStat(StatMaxHP))
										scr_increase_stat_card(affectedCard.player, affectedCard.position, StatMaxHP, 6)
										scr_increase_stat_card(affectedCard.player, affectedCard.position, StatHP, 6)
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
				case 4://Sacrifice Wheel Effects
					switch(effectNum){
						case 0:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcSacrifice], [], -1, -1, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6].fieldCard[resolvingPile[positionInOrder, 5]].sacrificable = true
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_deck([player], [TypeMonster], 1, 12, [ArcNightmareBeast], [], false, -1, 5)
										NextStep
									break;
									case 4:
										scr_search(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										scr_set_stat_player(player, PlayerMana, getStat(PlayerMaxMana))
										FinishResolving
									break;
									
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
				case 5://Fisherman Wheel
					switch(effectNum){
						case 0:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_deck([player, opponent], [TypeMonster], 1, 12, [ArcFisherman], [], -1, -1, 5)
										NextStep
									break;
									case 4:
										scr_search(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced && player.handCount < 5){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										scr_add_to_hand(player, [91, 0])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_choose_field_zones([player], false, true, false, 5)
										NextStep
									break;
									case 4:
										scr_recruit(86, 0, resolvingPile[positionInOrder, 5])
										scr_draw(player, 1, true)
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
				case 6://Classic Wheel v1.0
					switch(effectNum){
						case 0:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_field([player], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
										NextStep
									break;
									case 4:
										scr_increase_stat_card(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5], StatATK, 2)
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										scr_draw(player, 1, true)
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								wheel_opt[effectNum] = true
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_deck([player], [TypeSpell], 1, 12, [], [], false, -1, 5)
										NextStep
									break;
									case 4:
										scr_search(player, resolvingPile[positionInOrder, 5])
										FinishResolving
									break;									
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
				case 7://X-Makine Heat Meter
					switch(effectNum){
						case 0:
							if(!effectSilenced && getStat(PlayerMomentum) == 3){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 3)
										NextStep
									break;
									case 2:
										for(var i = 0; i < player.field_zone_count; i++){
											if(scr_check_archetype(player.field[i], ArcXMakine)){
												scr_increase_stat_card(player, i, StatATK, 1)
												scr_increase_stat_card(player, i, StatMaxHP, 1)
												scr_increase_stat_card(player, i, StatHP, 1)
											}
										}
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 1:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 6)
										NextStep
									break;
									case 2:
										scr_increase_stat_player(player, PlayerHP, 6)
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 2:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 9)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0
										scr_target_momentum_deck_impact(player, wheelNum, 5)
										NextStep
									break;
									case 4:
										resolvingPile[positionInOrder, 6] = []
										scr_select_materials(player, resolvingPile[positionInOrder, 5], 6)
										NextStep
									break;
									case 6:
										for(var i = 0; i < array_length(resolvingPile[positionInOrder, 6]); i++){
											scr_send_material(player, resolvingPile[positionInOrder, 6][i], resolvingPile[positionInOrder, 5])
										}
										instance_destroy(obj_appropiate_targets)
										resolvingPile[positionInOrder, 7] = 0
										scr_choose_field_zones([player], false, false, true, 7)
										NextStep
									break;
									case 8:
										scr_summon_momentum_deck(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 7])
										FinishResolving
									break;
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
						case 3:
							if(!effectSilenced){
								switch(resolutionStep){
									case 1:
										scr_pay_momentum(player, 12)
										NextStep
									break;
									case 2:
										resolvingPile[positionInOrder, 5] = 0;
										scr_target_field([player, opponent], [TypeMonster, TypeMomentum], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
										NextStep
									break;
									case 4:
										scr_destroy(resolvingPile[positionInOrder, 6], resolvingPile[positionInOrder, 5], SendEffect)
										FinishResolving
									break;				
								}
							}else{
								FinishResolving
							}
							if(resolutionStep = 98){
								resolvingPile[positionInOrder,2] = 99
							}
						break;
					}
				break;
			}
		break;
		case "SharedEffects":
			switch(effectNum){
				case SharedVisclades://Visclades Shared Effect
					if(!effectSilenced){
						scr_increase_stat_player(player, PlayerMana, 1)
						scr_lock_wheel(player)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case SharedUnderworldVisclades://Underworld Visclades Shared Effect
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_infirmary([player], [TypeMonster], 1, 12, [ArcVisclades], [], true, -1, -1, -1, 5);
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder,6] = -1
								scr_choose_field_zones([player], false, true, false, 6);
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(player, resolvingPile[positionInOrder,5], resolvingPile[positionInOrder,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
				case SharedIgloo://Igloo Shared Effect
					if(!effectSilenced && !fieldCard[position].getStatus(StatusSilenced)){
						for(var i = 0; i < player.field_zone_count; i++){
							if(i == position){continue;}
							if(scr_check_archetype(player.field[i, 0], ArcIgloo)){
								scr_bounce(player, i)
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case SharedSacrifice://Sacrifice Shared Effect
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 5);
								NextStep
							break;
							case 3:
								scr_recruit(74, 0, resolvingPile[positionInOrder,5])//Useless Sacrifice
								
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 6);
								break;
							case 5:
								scr_recruit(74, 0, resolvingPile[positionInOrder,6])//Useless Sacrifice
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}				
				break;
				case SharedXMakine://XMakine Shared Effect
					if(!effectSilenced && !fieldCard[position].getStatus(StatusSilenced)){
						scr_increase_stat_player(player, PlayerMomentum, -3)
					}
					resolvingPile[positionInOrder,2] = 99					
				break;
			}
			
		break;
		case 1://Motorbiker Showman Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						scr_increase_stat_player(player, PlayerMomentum, 1);
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}				
		break;
		case 2://Motorbiker Doppelganger Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 5);
								
								NextStep
							break;
							case 3:
								scr_summon_from_deck_name(player, 2, resolvingPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 3://Motorbiker Wild Rider Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						scr_burn(opponent,2,cardNum)
						scr_increase_stat_player(player, PlayerMomentum, 1)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}
		break;		
		case 4://Motorbiker V-Rider Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						for(var i=0; i < player.field_zone_count; i++){
							if(scr_check_archetype(field[i, 0], ArcMotorbiker)){
									scr_increase_stat_card(player, i, StatATK, 1)
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}
		break;
		case 5://Motorbiker D-Rider Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						for(var i = 0; i < 5; i++){
							if(field[i, 0]> 0){
								if(scr_check_archetype(field[i, 0], ArcMotorbiker)){
									scr_increase_stat_card(player, i, StatMaxHP, 1)
									scr_increase_stat_card(player, i, StatHP, 1)
								}
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		
		case 6://Motorbiker Violent Wheeler Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						if(scr_set_status_card(player, position, StatusCantAttackDirect, true)){
							player.fieldCard[position].attacksLeft++;
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		
		case 7://Motorbiker Protector Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						for(var i = 0; i < player.field_zone_count; i++){
							if(scr_check_archetype(field[i, 0], ArcMotorbiker)){
								scr_increase_stat_card(player, i, StatArmor, 1)
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 8://Rev Up the Engines Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								scr_target_deck([player], [TypeMonster], 1, 12, [ArcMotorbiker], [], false, -1, 5);
								NextStep
							break;
							case 3:
								scr_search(player, resolvingPile[positionInOrder,5])
								scr_increase_stat_player(player, PlayerMomentum, 3)
								scr_lock_wheel(player)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
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
								resolvingPile[positionInOrder,5] = 0
								scr_target_infirmary([player], [TypeMomentum], 1, 12, [ArcMotorbikerLeader], [], true, 0, -1, 0, 5);
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder,6] = 0
								scr_target_momentum_deck([player], 1, 12, [ArcMotorbikerLeader], [], true, 1, 6);
								scr_voidfy_infirmary(obj_player, resolvingPile[positionInOrder,5]);
								NextStep
							break;
							case 5:
								resolvingPile[positionInOrder,7] = 0
								scr_choose_field_zones([player], false, false, true, 7);
								NextStep
							break;
							case 7:
								scr_summon_momentum_deck(player, resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,7]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 10://The Hunt is on Boys! Effect
			switch(effectNum){
				case 0:
					scr_burn(obj_opponent,5,cardNum);
					for (i = 0; i < player.field_zone_count ; i++){
						scr_damage_card(obj_opponent, i, 5);
					}
					scr_discard(player, position)				
				break;
			}
		break;	
		case 11://Motorbiker Leader Khan Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder, 5] = 0
								scr_target_deck([player], [TypeMonster], 1, 2, [ArcMotorbiker], [], true, -1, 5);
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder, 6] = 0
								scr_choose_field_zones([player], false, true, false, 6);
								NextStep
							break;
							case 5:
								scr_summon_from_deck(resolvingPile[positionInOrder,5], resolvingPile[positionInOrder, 6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;			
		case 12://Motorbiker Leader Luther Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								resolvingPile[positionInOrder,6] = 0; //player
								scr_target_field([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								resolvingPile[positionInOrder,2] = 2
							break;
							case 3:
								scr_damage_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5] ,player.fieldCard[position].getStat(StatATK))
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 13://Motorbiker Leader Toku Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						with(player.fieldCard[position]){
							scr_increase_stat_card(player, position, -floor(getStat(StatHP)/2), 1)
							scr_increase_stat_card(player, position, StatATK, 4);					
						}
					}
				break;
			}
		break;
		case 14://Motorbiker Leader Cleo Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								resolvingPile[positionInOrder,6] = 0; //player
								scr_target_field([opponent], [], [1, 12], [1, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatATK, -2)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}							
				break;
			}
		break;
		case 15://Motorbiker Leader Ceasar Effect
			switch(effectNum){
				
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						scr_burn(opponent,2,15);
					}
				break;
			}
		break;
		case 16://EoS Embodiment of Speed Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								resolvingPile[positionInOrder,6] = 0; //player
								scr_target_field([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								with(resolvingPile[positionInOrder,6].fieldCard[resolvingPile[positionInOrder,5]]){
									var absorbCount = 0;
									absorbCount += getStat(StatATK) - 1;
									absorbCount += getStat(StatHP) - 1;
									scr_set_stat_card(player, self.position, StatATK, 1);
									scr_set_stat_card(player, self.position, StatHP, 1);
									scr_set_stat_card(player, self.position, StatMaxHP, 1);
								}
								scr_increase_stat_card(player, position, StatATK, absorbCount)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
				case 1://Tag Out Effect
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_destroy(player, position, SendEffect)
								resolvingPile[positionInOrder,5] = 0
								scr_target_momentum_deck([player], 1, 12, [ArcMotorbikerLeader], [], true, -1, 5);
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder,6] = 0
								scr_choose_field_zones([player], false, false, true, 6);
								NextStep
							break;
							case 5:
								scr_summon_momentum_deck(player, resolvingPile[positionInOrder,5], resolvingPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 17://Lentus Vio Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						fieldCard[position].attacksLeft++;
						scr_increase_stat_card(player, position, StatATK, 1);
						scr_increase_stat_card(player, position, StatHP, -1);
					}
					scr_message_field_card_stats(position)	
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 18://Riti Ava Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_draw(player, 1, true)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 19://Idine Lib Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder, 6] = scr_find_infirmary(opponent, resolvingPile[positionInOrder,5])
								//TODO why the FUCK is it not getting the right infirmaryPos but sending the cardNum instead. Add a 3D layer to the infirmary array
								//maybe based on getting targeted for certain effects?
								resolvingPile[positionInOrder, 7] = opponent.infirmary[resolvingPile[positionInOrder,6],1]//Card's ArtNum
								NextStep
							break;
							case 2:
								resolvingPile[positionInOrder, 8] = 0
								scr_choose_field_zones([player], false, true, false, 8);
								NextStep
							break;
							case 4:
								with(scr_summon([resolvingPile[positionInOrder,5], resolvingPile[positionInOrder, 7]], player, SummonEffect, -1, resolvingPile[positionInOrder, 8])){
									scr_silence(player, self.position);
									scr_paralyze(player, self.position);
									scr_decide_field_card_stats(player, self.position);
								}
								scr_remove_from_infirmary(opponent, resolvingPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 20://Satio Ces Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						scr_spin(player, position);
					}
					resolvingPile[positionInOrder,2] = 99					
				break;
			}
		break;
		case 21://Luvies Ing Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						player.fieldCard[position].sacrificable = true
						scr_increase_stat_card(player,position, StatLevel, 4)
						scr_lock_wheel(player)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_voidfy_infirmary(player, position)
								scr_target_field([player], [], [1, 12], [0, infinity], [0, infinity], [ArcVisclades], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatMaxHP, 2)
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatHP, 2)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}				
				break;
			}
		break;
		case 22://Tia Invaden Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								resolvingPile[positionInOrder,6] = 0; //player
								scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_copy_stats(resolvingPile[positionInOrder,6].fieldCard[resolvingPile[positionInOrder,5]], player.fieldCard[position], [StatATK, StatMaxHP, StatHP])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 23://Gloria Fastus Visclades Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						for(var i=0; i < 5; i++){
							if (opponent.field[i, 0] > 0){
								scr_damage_card(opponent, i, 1);
							}
						}
						scr_damage_card(player, position, 4);

						scr_burn(player,4,cardNum)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 24://Cries of the Underworld Effect
			switch(effectNum){
				case 0:			
					if(!effectSilenced && scr_count_infirmary_filter([player], [], 1, 12, [ArcVisclades], [], false, -1, -1, -1) >= 4){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder, 5] = 0
								scr_target_momentum_deck([player], 1, 12, [ArcVisclades], [], true, -1, 5);
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder, 6] = 0
								scr_choose_field_zones([player], false, false, true, 6);
								NextStep
							break;
							case 5:
								with(scr_summon_momentum_deck(player, resolvingPile[positionInOrder,5], resolvingPile[positionInOrder, 6])){
										scr_set_status_card(self.player, self.position, StatusSelfDestruct, true);
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 25://Second Coming Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_infirmary([player], [TypeMonster], 1, 12, [ArcVisclades], [], true, -1, -1, -1, 5)
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder, 6] = 0
								scr_choose_field_zones([player], false, true, false, 6);
								NextStep							
							break;
							case 5:
								scr_summon_from_infirmary(player, resolvingPile[positionInOrder,5], resolvingPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder,5] = 0
								scr_target_deck([player], [TypeMonster], 1, 12, [ArcVisclades], [], false, -1, 5)
								NextStep
							break;
							case 3:
								scr_mill(player, resolvingPile[positionInOrder,5])
								NextStep
							break;
							case 4:
								resolvingPile[positionInOrder,6] = 0
								resolvingPile[positionInOrder,7] = 0
								scr_target_field([player], [], [1, 12], [0, infinity], [0, infinity], [ArcVisclades], [], -1, -1, 6)
								NextStep
							break;
							case 6:
								scr_increase_stat_card(resolvingPile[positionInOrder,7], resolvingPile[positionInOrder,6], StatATK, 2)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 27://Visclades Denial Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_silence(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;//Visclades Anger Effect
		case 28:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_burn(obj_player,2,cardNum);
						scr_burn(obj_opponent,2,cardNum);
						for(var i = 0; i < 5; i++){
							if(obj_player.field[i, 0] > 0){
								scr_damage_card(obj_player, i, 2)
							}
						}
						for(var i = 0; i < 5; i++){
							if(obj_opponent.field[i, 0] > 0){
								scr_damage_card(obj_opponent, i, 2)
							}
						}					
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 29://Visclades Bargaining Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						scr_increase_stat_player(player, PlayerHP, getStat(PlayerMana)*3)
						scr_increase_stat_player(player, PlayerMana, -getStat(PlayerMana))
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}			
		break;
		case 30://Visclades Depression Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						for(var i = 0; i < 5; i++){
							if(opponent.field[i, 0] > 0){
								scr_set_status_card(opponent, i, StatusUnarmed, true)
							}
						}
					}
				break;
			}
		break;
		case 31://Visclades Acceptance Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						var visclades=0;
						for (i = 0; i < obj_player.infirmaryCount; i++){
							if(scr_check_archetype(obj_player.infirmary[i,0], ArcVisclades)){
								visclades++
							}
						}
						scr_increase_stat_card(player, position, StatATK, visclades);
						scr_increase_stat_card(player, position, StatMaxHP, visclades);
						scr_increase_stat_card(player, position, StatHP, visclades);
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_set_status_card(player, position, StatusIndestructable, false)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 33://Pole Clan Builder Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = -1
								scr_choose_field_zones([player], false, true, false, 5);
								NextStep
							break;
							case 3:
								scr_summon_from_deck_name(player, 32, resolvingPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}	
		break;	
		case 34://Pole Clan Archer Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_burn(opponent, 3, cardNum)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 35://Pole Clan Mage Effect
			switch(effectNum){
				case 0:
							
					if(scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1) && !fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_deck([player], [TypeSpell], 0, 0, [ArcBlizzard], [], false, -1, 5)
								NextStep
							break;
							case 3:
								scr_search(player, resolvingPile[positionInOrder,5])
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
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}						
		break;
		case 36://Pole Clan Defender Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						for(i = 0; i < 5; i++){
							if(!scr_check_archetype(player.field[i, 0], ArcIgloo)){continue;}
							scr_increase_stat_card(player, i, StatDodge, 1)
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case 1:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						for(i = 0; i < 5; i++){
							if(!scr_check_archetype(player.field[i, 0], ArcIgloo)){continue;}
							scr_heal_card(player, i, 1)
						}					
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 37://Pole Clan Beast Effect
			switch(effectNum){
				case 0:
					if(scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1) && !fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_increase_stat_card(player, position, StatATK, 3)
						scr_increase_stat_card(player, position, StatMaxHP, 2)
						scr_increase_stat_card(player, position, StatHP, 2)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 38://Pole Clan Torch Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_burn(opponent, 1, cardNum)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}			
		break;
		case 39://Blizzard Icewall Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_pay_momentum(player, 1);
								NextStep
							break;
							case 2:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0 //player
								scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1, 5)
								NextStep
							break;
							case 4:
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatMaxHP, 5)
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatHP, 5)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								scr_pay_momentum(player, 3);
								NextStep
							break;
							case 2:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0 //player
								scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1, 5)
								NextStep
							break;
							case 4:
								scr_burn(obj_opponent, resolvingPile[positionInOrder,6].fieldCard[resolvingPile[positionInOrder,5]].getStat(StatHP), cardNum)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder,5] = 0
								scr_target_deck([player], [TypeMonster], 1, 12, [ArcPoleClan], [], false, -1, 5)
								NextStep
							break;
							case 3:
								scr_search(player, resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 42://Blizzard Hibernation Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && player.getStat(PlayerMomentum) >= 3){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_paralyze(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;			
		case 43://Blizzard Lockdown Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								resolvingPile[positionInOrder,7] = 0 //Discarded Card
								scr_target_hand([player], [TypeMonster], 1, 12, [], [], false, position, 2, 5)
								NextStep
							break;
							case 3:
								var discardLevel = macros.origStat[resolvingPile[positionInOrder, 7], StatLevel]
								scr_discard(player, resolvingPile[positionInOrder, 5])
								resolvingPile[positionInOrder,8] = 0
								resolvingPile[positionInOrder,9] = 0
								scr_target_field([opponent], [], [1, discardLevel], [0, infinity], [0, infinity], [], [], -1, -1, 8)
								NextStep
							break;
							case 5:
								scr_silence(resolvingPile[positionInOrder,9], resolvingPile[positionInOrder,8])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								scr_pay_momentum(player, 3)
								NextStep
							break;
							case 2:
								var choiceArray = []
								if(scr_count_field(opponent) != 0){
									array_push(choiceArray, [0, "To Monster"])
								}
								array_push(choiceArray, [1, "To Opponent"])
								resolvingPile[positionInOrder, 5] = 0
								scr_give_choice(5, choiceArray)
								NextStep
							break;
							case 4:
								switch(resolvingPile[positionInOrder, 5]){
									case 0:
										resolvingPile[positionInOrder, 6] = 0
										resolvingPile[positionInOrder, 7] = 0
										scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 6)
										NextStep
									break;
									case 1:
										scr_burn(obj_opponent, 4, cardNum);
										FinishResolving
									break;
								}
							break;
							case 6:
								scr_damage_card(resolvingPile[positionInOrder,7], resolvingPile[positionInOrder,6], 7)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 47://Igloo Castle Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_infirmary([player], [TypeMonster, TypeMomentum], 1, 12, [ArcPoleClan], [], true, -1, -1, -1, 5)
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder, 6] = 0
								scr_choose_field_zones([player], false, true, false, 6);
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(player, resolvingPile[positionInOrder,5], resolvingPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;		
		case 48://Igloo Citadel Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						for(i = 0; i < 5; i++){
							if(scr_check_archetype(player.field[i], ArcPoleClan)){
								scr_increase_stat_card(player, i, StatArmor, 1)
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 49://Igloo Kingdom Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 5);
								NextStep
							break;
							case 3:
								scr_recruit(34, 0, resolvingPile[positionInOrder,5]);
								NextStep
							break;
							case 4:
								resolvingPile[positionInOrder,6] = 0
								scr_choose_field_zones([player], false, true, false, 6);
								NextStep
							break;
							case 6:
								scr_recruit(34, 0, resolvingPile[positionInOrder,6]);
								NextStep
							break;

						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder, 5] = handCount;
								NextStep
							break;
							case 2:
								scr_discard(player, 0);
								resolvingPile[positionInOrder,6] = 5 //Timer betweeen discards
								resolvingPile[positionInOrder,7] = 2 //Timer result
								
								if(handCount){
									resolvingPile[positionInOrder,2] = 50 //Timer Activate
									break;
								}
								NextStep
							break;
							case 3:
								scr_draw(player, 1, true);
								resolvingPile[positionInOrder,6] = 5 //Timer betweeen discards
								resolvingPile[positionInOrder,7] = 3 //Timer result
								
								if(handCount != resolvingPile[positionInOrder,5]){
									resolvingPile[positionInOrder,2] = 50 //Timer Activate
									break;
								}
								NextStep
							break;
							case 4:
								scr_increase_stat_player(player, PlayerMomentum, resolvingPile[positionInOrder,5])
								FinishResolving
							break;
							case 50:
								if(!resolvingPile[positionInOrder,6]--){
									resolvingPile[positionInOrder,2] = resolvingPile[positionInOrder,7];
								}
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder, 5] = 0
								scr_target_infirmary([player], [TypeMonster, TypeMomentum], 1, player.getStat(PlayerMomentum), [], [], true, -1, -1, -1, 5)
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder, 6] = 0
								scr_choose_field_zones([player], false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_increase_stat_player(player, PlayerMomentum, -macros.origStat[obj_player.infirmary[resolvingPile[positionInOrder, 5],0], StatLevel])
								scr_summon_from_infirmary(player, resolvingPile[positionInOrder, 5], resolvingPile[positionInOrder, 6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}		
		break;
		case 53://Healing Lullaby Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_increase_stat_player(player, PlayerHP, getStat(PlayerMomentum)*2);						
						scr_increase_stat_player(player, PlayerMomentum, -getStat(PlayerMomentum));
					}
					
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 54://Battle Medic Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_infirmary([player], [TypeMonster], 1, 2, [], [], false, -1, -1, -1, 5);
								NextStep
							break;
							case 3:
								scr_recover_infirmary(player, resolvingPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 55://Garbage Collector Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_increase_stat_card(player, position, StatATK, 1);
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 56://Earthquake Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						for(var i = 0; i < 5; i++){
							if(instance_exists(obj_player.fieldCard[i])){
								scr_bounce(obj_player, i);
								scr_increase_stat_player(obj_player, PlayerMomentum, 3)
							}
							if(instance_exists(obj_opponent.fieldCard[i])){
								scr_bounce(obj_opponent, i);
								scr_increase_stat_player(obj_opponent, PlayerMomentum, 3)								
							}
						}
					}
					
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 57://Power Discharge Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_hand([player], [], 1, 12, [], [], true, position, -1, 5);
								NextStep
							break;
							case 3:
								scr_discard(player, resolvingPile[positionInOrder,5])
								if(obj_player.getStat(PlayerHP) >= 5){
									for(var i = 0; i < 5; i++){
										scr_destroy(player, i, 1)
										scr_destroy(opponent, i, 1)
									}
									FinishResolving
									break;
								}
								resolvingPile[positionInOrder,6] = 0
								resolvingPile[positionInOrder,7] = 0
								scr_target_field([player, opponent], [], [1, 4], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 5:
								scr_destroy(resolvingPile[positionInOrder,7], resolvingPile[positionInOrder,6], 1)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 58://Man with A Shield Effect 
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 5)
								NextStep
							break;
							case 3:
								scr_recruit(59, 0, resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 60://The Great Leader Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_hand([player], [], 1, 12, [], [], true, position, -1, 5);
								NextStep
							break;
							case 3:
								scr_discard(player, resolvingPile[positionInOrder,5])
								resolvingPile[positionInOrder,6] = 0;
								scr_choose_field_zones([player], false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_recruit(61, 0, resolvingPile[positionInOrder,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 61://Bodyguard Effect
			switch(effectNum){
				case 0://Summon
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						for (var i = 0; i < 5; i++){
							if(player.field[i,0] == 60){
								scr_set_status_card(player, i, StatusIndestructable, true)
							}
						}						
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case 1://Destruction
					if(!effectSilenced){				
						if(!scr_if_you_control(61)){
							for (var i = 0 ; i < 5; i++){
								if(player.field[i,0] == 60){
								scr_set_status_card(player, i, StatusIndestructable, false)								}
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;				
			}		
		break;		
		case 62://Awoken Civillian Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 5)
								NextStep
							break;
							case 3:
								scr_recruit(63, 0, resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 63://Rebellion Ally Effect
			switch(effectNum){
				case 0://Summon
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						for (var i = 0; i < 5; i++){
							if(player.field[i, 0] == 62){
								scr_increase_stat_card(player, i, StatMaxHP, 3)
								scr_increase_stat_card(player, i, StatHP, 3)
							}
						}						
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case 1://Destruction
					if(!effectSilenced){				
						for (var i=0;i<5;i++){
							if(player.field[i, 0]==62){
								scr_increase_stat_card(player, i, StatATK, 3)
								scr_message_field_card_stats(i);
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;						
			}		
		break;
		case 64://Lunar Tank Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_burn(opponent, 6, 64)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 65://Homesick Soldier
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_spin(player, position)
					}
					
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 66://Bloodthirst Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_pay_momentum(player, 3);
								NextStep
							break;
							case 2:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [], [SpiritAggressive, SpiritMalicious], -1, -1, 5)
								NextStep
							break;
							case 4:
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatATK, 4)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 67://Pan Fighter Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_increase_stat_player(player, PlayerHP, 3);
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 68://Machine Gun Soldiers Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						for(var i = 0; i < player.field_zone_count; i++){
							if(opponent.field[i]){
								scr_damage_card(opponent, i, 1);
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 69://Speed Soldier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_draw(player, 1, true)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 70://Vengeful Cyborg Effect
			switch(effectNum){
				case 0://Summon Self Paralyze
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_paralyze(player, position)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
				case 1://Momentum Gain
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_increase_stat_player(player, PlayerMomentum, resolvingPile[positionInOrder,5])
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 71://Armed Civillian Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_damage_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], 1);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 72://Torch Carrier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								scr_mill_from_top(player, 3)
								NextStep
							break;
							case 2:
								scr_increase_stat_card(player, position, StatATK, 1);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 73://Baby Phoenix Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								if(player.getStat(PlayerMana) < 2){
									resolvingPile[positionInOrder,2] = 97
									break;
								}
								NextStep
							break;
							case 2:
								scr_increase_stat_player(player, PlayerMana, -2);
							case 3:
								resolvingPile[positionInOrder,5] = 0;
								scr_choose_field_zones([player], false, true, false, 5)
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(player, position, resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 74://Useless Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						fieldCard[position].sacrificable = true;
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;		
		case 75://Wealthy Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){				
						scr_draw(player, 1, true);
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 76://Ruthless Sacrifice Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([opponent], [], [1, 4], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_destroy(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], 1)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder, 5] = 0
								scr_target_infirmary([player], [TypeMonster, TypeMomentum], 1, 12, [ArcNightmareBeast], [], true, -1, -1, -1, 5);
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder,6] = 0
								scr_choose_field_zones([player], false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_summon_from_infirmary(player, resolvingPile[positionInOrder,5], resolvingPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
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
									resolvingPile[positionInOrder,2] = 97
								}
								NextStep
							break;
							case 2:
								resolvingPile[positionInOrder,5] = 0;
								scr_target_deck([player], [TypeMonster], 0, 12, [ArcSacrifice], [], false, -1, 5)
								NextStep
							break;
							case 4:
								scr_search(player, resolvingPile[positionInOrder,5]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
							if(player.field[i, 0] && scr_check_archetype(player.field[i, 0], ArcSacrifice) && (lowestLevel == 0 || lowestLevel > player.fieldCard[i].getStat(StatLevel))){
								lowestLevel = player.fieldCard[i].getStat(StatLevel)
							}
						}
						scr_increase_stat_player(player, PlayerMana, lowestLevel);
					}
					
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 80://Silent Courage Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([player], [], [1, 12], [0, infinity], [0, infinity], [ArcSacrifice], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_set_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatusTAUNT, true);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 81://Nightmare Beast- Crystal Echo Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								resolvingPile[positionInOrder,6] = 0;
								scr_target_field([opponent], [], [1, 4], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								var reflectedMonster = resolvingPile[positionInOrder,6].fieldCard[resolvingPile[positionInOrder,5]];
								resolvingPile[positionInOrder,7] = reflectedMonster.getStat(StatATK);
								resolvingPile[positionInOrder,8] = reflectedMonster.getStat(StatHP);
								scr_set_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatusUnarmed, true);
								resolvingPile[positionInOrder,9] = 0;
								scr_choose_field_zones([player], false, true, false, 9)
								NextStep
							break;
							case 5:
								with(scr_recruit(116, 0, resolvingPile[positionInOrder,9])){
									scr_set_stat_card(self.player, self.position, StatMaxHP, resolvingPile[positionInOrder,8])
									scr_set_stat_card(self.player, self.position, StatATK, resolvingPile[positionInOrder,7])
									scr_set_stat_card(self.player, self.position, StatHP, resolvingPile[positionInOrder,8])
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 82://Nightmare Beast Conductrons Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						for(i = 0; i < player.field_zone_count; i++){
							if(opponent.field[i, 0]){
								scr_increase_stat_card(opponent, i, StatATK, -1)
								scr_increase_stat_card(opponent, i, StatMaxHP, -1)
								scr_increase_stat_card(opponent, i, StatHP, -1)
								scr_increase_stat_card(player, position, StatATK, 2)
								scr_increase_stat_card(player, position, StatMaxHP, 2)
								scr_increase_stat_card(player, position, StatHP, 2)
							}
						}
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 83://Fisherman Rookie Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_choose_field_zones([player], false, true, false, 5)
								NextStep
							break;
							case 3:
								scr_recruit(84, 0, resolvingPile[positionInOrder,5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 85://Wise Fisherman Effect 
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolvingPile[resolutionStep,5]
								resolvingPile[resolutionStep,6] = 84 //Fish to Summon
								resolvingPile[resolutionStep,7] = 0
																
								if(randomResult < 10){
									FinishResolving
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones([player], false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 98){
									scr_choose_field_zones([player], false, true, false, 7);
									resolvingPile[resolutionStep,2] = 6;
									break;
								}
								resolvingPile[resolutionStep,6] = 86 //Goldfish
								scr_choose_field_zones([player], false, true, false, 7);
								NextStep
							break;
							case 5:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								resolvingPile[resolutionStep,5] = 10
								resolvingPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 87://Lucky Fisherman Effect 
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolvingPile[resolutionStep,5]
								resolvingPile[resolutionStep,6] = 84 //Fish to Summon
								resolvingPile[resolutionStep,7] = 0
								
								if(randomResult < 40){
									scr_destroy(player, position, 1)
									FinishResolving
									break;
								}
								if(randomResult < 60){
									scr_choose_field_zones([player], false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 95){
									scr_choose_field_zones([player], false, true, false, 7);
									resolvingPile[resolutionStep,2] = 6;
									break;
								}
								resolvingPile[resolutionStep,6] = 86//Goldfish
								scr_choose_field_zones([player], false, true, false, 7);
								NextStep
							break;
							case 5:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								resolvingPile[resolutionStep,5] = 40								
								resolvingPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position);
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 88://Strong Fisherman Effect 
			switch(effectNum){
				case 0://Recruit Fish
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolvingPile[resolutionStep,5]
								resolvingPile[resolutionStep,6] = 84 //Fish to Summon
								resolvingPile[resolutionStep,7] = 0
								
								if(randomResult < 10){
									FinishResolving
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones([player], false, true, false, 7);
									NextStep
									break;
								}
								scr_target_field([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 7)
								resolvingPile[resolutionStep,2] = 6
							break;
							case 5:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_destroy(resolvingPile[resolutionStep,8], resolvingPile[resolutionStep,7], 1)
								resolvingPile[resolutionStep,5] = 10								
								resolvingPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
				case 1://ATK Gain
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						scr_increase_stat_card(player, position, StatATK, 1)
						FinishResolving
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 89://Naive Fisherman Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolvingPile[resolutionStep,5]
								resolvingPile[resolutionStep,6] = 84 //Fish to Summon
								resolvingPile[resolutionStep,7] = 0
								
								if(randomResult < 10){
									for(var i = 0; i < player.field_zone_count; i++){
										if(scr_check_archetype(player.field[i, 0], ArcFish)){
											scr_set_stat_card(player, i, StatusUnarmed, true)
										}
									}									
									FinishResolving
									break;
								}
								if(randomResult < 30){
									scr_choose_field_zones([player], false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones([player], false, true, false, 7);
									resolvingPile[resolutionStep,2] = 6;
									break;
								}
								resolvingPile[resolutionStep,6] = 86 //Goldfish
								scr_choose_field_zones([player], false, true, false, 7);
								resolvingPile[resolutionStep,2] = 8;
							break;
							case 5:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								with(scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])){
									scr_set_status_card(self.player, self.position, StatusUnarmed, true)
								}
								scr_choose_field_zones([player], false, true, false, 7);
								NextStep
							break;
							case 9:
								with(scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])){
									scr_set_status_card(self.player, self.position, StatusUnarmed, true)
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 90://Fisherman of the Oceans Effect 
			switch(effectNum){
				case 0://Recruit Fish
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolvingPile[resolutionStep,5]
								resolvingPile[resolutionStep,6] = 84 //Fish to Summon
								resolvingPile[resolutionStep,7] = 0
								
								if(randomResult < 30){
									scr_choose_field_zones([player], false, true, false, 7);
									resolvingPile[resolutionStep, 2] = 8
									break;
								}
								if(randomResult < 80){
									scr_target_infirmary([player], [TypeMonster, TypeMomentum], 1, 12, [ArcFisherman], [], true, -1, -1, -1, 7)
									resolvingPile[resolutionStep, 2] = 10
									break;
								}
								if(randomResult < 95){
									scr_choose_field_zones([player], false, true, false, 7);
									NextStep
									break;								
								}
								resolvingPile[resolutionStep,6] = 86
								scr_choose_field_zones([player], false, true, false, 7);
								resolvingPile[resolutionStep, 2] = 8
							break;
							case 5:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								scr_choose_field_zones([player], false, true, false, 7);
								NextStep
							break;
							case 7:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								scr_choose_field_zones([player], false, true, false, 7);
								NextStep
							break;
							case 9:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								scr_choose_field_zones([player], false, true, false, 7);
								FinishResolving
							break;
							case 11:
								scr_choose_field_zones([player], false, true, false, 8);
								NextStep
							break;
							case 13:
								scr_summon_from_infirmary(player, resolvingPile[resolutionStep,7], resolvingPile[resolutionStep,8])
								scr_choose_field_zones([player], false, true, false, 7);
								resolvingPile[resolutionStep, 2] = 8							
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						scr_decrease_effect_uses(player, position)
						resolvingPile[positionInOrder,2] = 99
					}
				break;
				case 1://Stat Gain
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						var foishi = resolvingPile[resolutionStep, 5]
						scr_increase_stat_card(player, position, StatATK, macros.origStat[foishi, StatATK]);
						scr_increase_stat_card(player, position, StatMaxHP, macros.origStat[foishi, StatMaxHP]);
						scr_increase_stat_card(player, position, StatHP, macros.origStat[foishi, StatHP]);
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder,5] = irandom(100)
								NextStep
								NextStep//Delete this one after the animation is added
							break;
							case 3:
								var randomResult = resolvingPile[resolutionStep,5]
								resolvingPile[resolutionStep,6] = 84 //Fish to Summon
								resolvingPile[resolutionStep,7] = 0
																
								if(randomResult < 10){
									FinishResolving
									break;
								}
								if(randomResult < 90){
									scr_choose_field_zones([player], false, true, false, 7);
									NextStep
									break;
								}
								if(randomResult < 98){
									scr_choose_field_zones([player], false, true, false, 7);
									resolvingPile[resolutionStep,2] = 6;
									break;
								}
								resolvingPile[resolutionStep,6] = 86 //Goldfish
								scr_choose_field_zones([player], false, true, false, 7);
								NextStep
							break;
							case 5:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								FinishResolving
							break;
							case 7:
								scr_recruit(resolvingPile[resolutionStep,6], 0, resolvingPile[resolutionStep,7])
								resolvingPile[resolutionStep,5] = 10
								resolvingPile[resolutionStep,2] = 3
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder,5] = scr_pay_momentum(player, player.getStat(PlayerMomentum));
								NextStep 
							break;
							case 2:
								if(!resolvingPile[positionInOrder,5]){
									FinishResolving
									break;
								}
								resolvingPile[positionInOrder,6] = irandom(100)
								NextStep
								NextStep//Add this to the animation
							break;
							case 4:
								var randomResult = resolvingPile[resolutionStep,6]
								resolvingPile[resolutionStep,7] = 84 //Fish to Summon
								resolvingPile[resolutionStep,8] = 0
																
								if(randomResult < 80){
									FinishResolving
									break;
								}
								if(randomResult < 95){
									scr_choose_field_zones([player], false, true, false, 8);
									NextStep
									break;
								}
								resolvingPile[resolutionStep,7] = 86 //Goldfish
								scr_choose_field_zones([player], false, true, false, 8);
								NextStep
							break;
							case 6:
								scr_recruit(resolvingPile[resolutionStep,7], 0, resolvingPile[resolutionStep,8])
								resolvingPile[resolutionStep,2] = 2
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder, 5] = 0
								scr_give_choice(5, choiceArray)
								NextStep
							break;
							case 3:
								var choice = resolvingPile[positionInOrder, 5];
								resolvingPile[positionInOrder, 6] = 0; //Voidfy Count
								resolvingPile[positionInOrder, 7] = 0;
								
								if(choice){
									if(resolvingPile[positionInOrder, 6]){
										resolvingPile[positionInOrder, 2] = 6
										break;
									}
									scr_target_infirmary_name(player, 86, 7)
									NextStep
									break;
								}
								if(resolvingPile[positionInOrder, 6] == 5){
									resolvingPile[positionInOrder, 2] = 6									
									break;	
								}
								scr_target_infirmary_name(player, 84, 7)
								NextStep
							break;
							case 5:
								scr_voidfy_infirmary(player, resolvingPile[positionInOrder, 7])
								resolvingPile[positionInOrder, 6]++
								resolvingPile[positionInOrder, 2] = 3
							break;
							case 6:
								scr_increase_stat_player(player, PlayerMana, 3);
								scr_draw(player, 1, true);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[positionInOrder,5] = 0;
								scr_target_infirmary_name(player, 86, 5)
								NextStep
							break;
							case 3:
								scr_voidfy_infirmary(player, resolvingPile[positionInOrder,5]);
								scr_draw(player, 2, true);
								resolvingPile[positionInOrder,6] = 0
								scr_target_deck([player], [TypeMonster], 1, 12, [ArcFisherman], [], false, -1, 6);
								NextStep
							break;
							case 5:
								scr_search(player, resolvingPile[positionInOrder,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 96://Fullteam Medics Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
						scr_increase_stat_player(player, PlayerHP, 6)
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;
		case 99://Single Shot Master Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([player, opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_destroy(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], 1);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 100://Desperate Power Measures Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_hand([player], [TypeMonster], 1, 12, [], [], false, position, -1, 5)
								NextStep
							break;
							case 3:
								scr_discard(player, resolvingPile[positionInOrder, 5])
								scr_increase_stat_player(player, PlayerMomentum, 3);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 101://Rogue Soldier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								scr_target_hand([player], [], 1, 12, [], [], false, position, -1, 5)
								NextStep
							break;
							case 3:
								scr_discard(player, resolvingPile[positionInOrder, 5])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 107://Casey X-Makine Cannons Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced && player.getStat(PlayerMomentum) <= 3){
						switch(resolutionStep){
							case 1:
								for(var i = 0; i < player.field_zone_count; i++){
									if(i != position && scr_check_archetype(player.field[i], ArcXMakine)){
										scr_increase_stat_card(player, i, StatATK, 1);
										resolvingPile[positionInOrder,2] = 2
									}
								}
								NextStep
							break;
							case 2:
								FinishResolving
							break;
							case 3:
								scr_increase_stat_player(player, PlayerMomentum, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}
				break;
			}		
		break;
		case 108://Theo X-Makine Cannons Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced && player.getStat(PlayerMomentum) <= 3){
						switch(resolutionStep){
							case 1:
								for(var i = 0; i < player.field_zone_count; i++){
									if(i != position && scr_check_archetype(player.field[i], ArcXMakine)){
										scr_increase_stat_card(player, i, StatMaxHP, 1);
										scr_increase_stat_card(player, i, StatHP, 1);
										resolvingPile[positionInOrder,2] = 2
									}
								}
								NextStep
							break;
							case 2:
								FinishResolving
							break;
							case 3:
								scr_increase_stat_player(player, PlayerMomentum, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}
				break;
			}		
		break;
		case 109://Lily, X-Makine Carrier Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced && player.getStat(PlayerMomentum) == 0){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								scr_target_deck([player], [TypeMonster], 1, 12, [ArcXMakine], [], false, -1, 5)
								NextStep
							break;
							case 3:
								scr_search(player, resolvingPile[positionInOrder]);
								scr_increase_stat_player(player, PlayerMomentum, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}
				break;
			}
		break;
		case 110://Robert, X-Makine Wheels Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced && player.getStat(PlayerMomentum) <= 3){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0;
								scr_target_infirmary([player], [TypeMonster], 1, 12, [ArcXMakine], [], false, -1, -1, -1, 5)
								NextStep
							break;
							case 3:
								scr_recover_infirmary(player, resolvingPile[positionInOrder]);
								scr_increase_stat_player(player, PlayerMomentum, 4);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}
				break;
			}
		break;
		case 111://Dom X-Makine Airforce Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced && player.getStat(PlayerMomentum) <= 3){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([player, opponent], [], [1, 11], [0, infinity], [0, infinity], [ArcXMakine], [], position, -1, 5)
								NextStep
							break;
							case 3:
								scr_increase_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatLevel, 1)
								scr_draw(player, 1, true)
								scr_increase_stat_player(player, PlayerMomentum, 4)
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}
				break;
			}
		break;
		case 112://Jason, DX-Makine Thundermech Effect
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								resolvingPile[positionInOrder,6] = 0
								scr_target_field([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1, 5)
								NextStep
							break;
							case 3:
								if(player.getStat(PlayerMomentum) <= 6){
									scr_silence(resolvingPile[positionInOrder,6],resolvingPile[positionInOrder,5])
									scr_increase_stat_player(player, PlayerMomentum, 6)
								}else{
									scr_damage_card(resolvingPile[positionInOrder,6],resolvingPile[positionInOrder,5], 8)
									scr_increase_stat_player(player, PlayerMomentum, -6)
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						resolvingPile[positionInOrder,2] = 99
						scr_decrease_effect_uses(player, position)
					}
				break;
			}
		break;
		case 113://Emergency Call Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], -1, -1) == 1 && scr_count_field(opponent)){
						switch(resolutionStep){
							case 1:
								resolvingPile[positionInOrder,5] = 0
								
								scr_target_deck([player], [TypeMonster], 1, 12, [ArcXMakine], [], true, -1, 5)
								NextStep
							break;
							case 3:
								resolvingPile[positionInOrder,6] = 0
								scr_choose_field_zones([player], false, true, false, 6)
								NextStep
							break;
							case 5:
								scr_summon_from_deck(resolvingPile[positionInOrder,5], resolvingPile[positionInOrder,6]);
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
								resolvingPile[resolutionStep,5] = scr_pay_momentum(player, getStat(PlayerMomentum));
								NextStep
							break;
							case 3:
								resolvingPile[resolutionStep,6] = 0;
								resolvingPile[resolutionStep,7] = 0;
								scr_target_field([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], -1, -1, 5)
								NextStep
							break;
							case 5:
								if(resolvingPile[resolutionStep,5]){
									scr_increase_stat_card(resolvingPile[resolutionStep,7], resolvingPile[resolutionStep,6], StatATK, resolvingPile[resolutionStep,5])
								}else{
									scr_set_stat_card(resolvingPile[positionInOrder,6], resolvingPile[positionInOrder,5], StatusTAUNT, true);
								}
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
		case 115://X-Makines Form Together! Effect
			switch(effectNum){
				case 0:
					if(!effectSilenced && scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], -1, -1) >= 2 && scr_count_field_filter([player], [TypeMomentum], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){
						switch(resolutionStep){
							case 1:
								for(var i = 0; i < player.field_zone_count; i++){
									scr_destroy(player, i, 1);
								}
								NextStep
							break;
							case 3:
								resolvingPile[resolutionStep,5] = 0
								scr_target_momentum_deck([player], 1, 12, [ArcXMakine], [], true, -1, 5)
							break;
							case 5:
								resolvingPile[resolutionStep,6] = 0
								scr_choose_field_zones([player], false, false, true, 5)
								NextStep
							break;
							case 7:
								scr_summon_momentum_deck(player, resolvingPile[resolutionStep,5], resolvingPile[resolutionStep,6])
								FinishResolving
							break;
						}
					}else{
						FinishResolving
					}
					if(resolutionStep = 98){
						
						resolvingPile[positionInOrder,2] = 99
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
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;		
	}

}
/*
		case CARDNUM://CARDNAME Effect TODO:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){				
					
					}
					resolvingPile[positionInOrder,2] = 99
				break;
			}		
		break;

		case CARDNUM://CARDNAME Effect TODO:
			switch(effectNum){
				case 0:
					if(!fieldCard[position].getStatus(StatusSilenced) && !effectSilenced){
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
						resolvingPile[positionInOrder,2] = 99
					}
				break;
			}
		break;
*/