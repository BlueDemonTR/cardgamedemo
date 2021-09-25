function scr_wheel_effects(argument0, argument1) {
	var wheelNum = argument0,
	wheelEffect = argument1;
	global.effect_successful = false;
	if(!obj_player.mid_effect && !obj_player.wheel_locked && obj_player.own_turn){
		if (scr_wheel_opt(wheelEffect)){
			switch(wheelNum){
				case 1://Motorbiker v1.0	
					switch (wheelEffect){ 
						case 1:
							with(obj_player){
								if(momentum >= 3){
									scr_search_archetype(1,0,0,13,"Motorbiker Wheel 1")
									if(global.effect_successful){
							
										momentum -= 3;
										scr_message_stats();
										obj_momentum_wheel.wheel_opt[wheelEffect] = true;
									}
						
								}
							}
						break;
						case 2:
							with(obj_player){
								if (momentum >= 6){
									scr_impact_summon(6);
								}
							}
				
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_search_name("Leader Takeover");
									if (global.effect_successful){
										momentum -= 9
										scr_message_stats();
										obj_momentum_wheel.wheel_opt[wheelEffect] = true;
									}
								}
							}
						break;
						case 4:
							with(obj_player){
								if(momentum >= 12){
									momentum -= 12
									scr_message_stats();
									for(var i = 0; i < 5; i++){
										if(field[i,0] > 0){
											with(fieldCard[i]){
												cardcan_attack = true;
												scr_message_field_card_stats(position)
											}
										}
									}
								wheel_locked = true;
								}
							}
						break;
					}
				break;
			
				case 2:
					switch(wheelEffect){
						case 1:
							with(obj_player){
								if(momentum >= 3){
									momentum -= 3
									mana += 2
									scr_message_stats();
								}
							}
						break;
						case 2:
							with(obj_player){
								if(momentum >= 6){

									scr_search_name("Cries of The Underworld");
									if (global.effect_successful){
										momentum -= 6;
										scr_message_stats();
									}
								}
							}
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_impact_summon(9);
								}
							}
						break;
						case 4:
							with(obj_player){
								if(momentum >= 12){
									momentum -= 12;
									scr_message_stats();
									for(i=0; i < 5; i++){
										if(obj_opponent.field[i,0] > 0){
											with(obj_opponent.fieldCard[i]){
												if(cardStat[0] <= 4){
													scr_destroy(i);
												}
											}	
										}
									}
								}
							}
						break;
					}
				break;
			
				case 3://Pole clan wheel	
					switch(wheelEffect){
						case 1:
							with(obj_player){
								if(momentum >= 3){
						
									for(i=0; i < 5; i++){
										if(scr_check_archetype(field[i,0],5)){
											fieldCard[i].cardStat[3] += 3;
											momentum -= 3
											scr_message_stats();
											return;
										}
									}
									if(!scr_if_field_full()){scr_summon_from_deck_name("Igloo");}
									if(global.effect_successful){
										momentum -= 3;
										scr_message_stats();
									}
								}
							}
						break;
						case 2:
							with(obj_player){
								if(momentum >= 6){
									if(!scr_if_field_full()){scr_summon_from_deck_name("Pole Clan Mage");}
									if (global.effect_successful){
										momentum -= 6;
										scr_message_stats();
									}
								}
							}
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_impact_summon(9);
								}
							}
						break;
						case 4:
							with(obj_player){
								if(momentum >= 12){
									scr_give_atk_hp("player","all",0,13,5,0,6,"Igloo Wheel 4",-1);
									if(global.effect_successful){
										momentum -= 12;
										scr_message_stats();
										obj_momentum_wheel.wheel_opt[wheelEffect] = true;		
									}
								}
							}
						break;
					}
				break;
		
				case 4://Wheel of the Beast Summoners	
					switch(wheelEffect){
						case 1:
							with(obj_player){
								if(momentum >= 3){
									scr_miscellaneous_target("player","all",0,13,7,"Sacrifice Wheel 1","Wheel",-1)
								}
								if (global.effect_successful){
										momentum -= 3;
										scr_message_stats();
								}						
							}
						break;
						case 2:
							with(obj_player){
								if(momentum >= 6){
									scr_search_archetype(8, 0,0,13, "Sacrifice Wheel 3");
									if (global.effect_successful){
											momentum -= 6;
											scr_message_stats();
									}
								}
							}
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_impact_summon(9)
								}
							}
						break;
						case 4:
							with(obj_player){
								if(momentum >= 12){
									mana = 8;
									scr_message_stats()
									global.effect_successful = true
									if (global.effect_successful){
											momentum -= 12;
											scr_message_stats();
									}
								}
							}	
						break;
					}
				break;
		
		
				case 5://Fishing Boat Wheel
					switch(wheelEffect){
						case 1:
							with(obj_player){
								if(momentum >= 3){
									scr_search_archetype(9, 0,0,13, "Fisherman Wheel 1")
									if(global.effect_successful){
										momentum -= 3
										scr_message_stats()
									}
								}
							}
						break;
						case 2:
							with(obj_player){
								if(momentum >= 6){
									scr_spell_effects(91)
									if(global.effect_successful){
										momentum -= 6
										scr_message_stats()
									}
								}
							}
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_impact_summon(9)
								}
							}
						break;
				
			
						case 4:
							with(obj_player){
								if(momentum >= 12){
									scr_recruit(86, 0,"Fisherman Wheel Effect 4")
									if(global.effect_successful){
										momentum -= 12
										scr_message_stats()
									}
								}				
							}
						break;
					}
				break;		
		
				case 6://Generic Wheel 1
					switch(wheelEffect){
						case 1:
							with(obj_player){
								if(momentum >= 3){
									scr_give_atk_hp("player","all",0,13,"any",2,0,"Generic Wheel v1.0 Effect 1",-1)
									if(global.effect_successful){
										momentum -= 3
										scr_message_stats()
									}
								}
							}
						break;
						case 2:
							with(obj_player){
								if(momentum >= 6){
									scr_draw(1, true)
									if(global.effect_successful){
										obj_momentum_wheel.wheel_opt[wheelEffect] = true;
										momentum -= 6
										scr_message_stats()
									}
								}
							}
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_impact_summon(9)
								}
							}
						break;
				
			
						case 4:
							with(obj_player){
								if(momentum >= 12){
									scr_search_archetype("any",0,-2,1,"Generic Wheel Effect 4")
									if(global.effect_successful){
										momentum -= 12
										scr_message_stats()
									}
								}				
							}
						break;
					}
				break;		
				case 7://Heat Meter
					switch(wheelEffect){
						case 1:
							with(obj_player){
								if(momentum = 3){
									for(var i=0; i < 5; i++){
										if(field[i,0]> 0){
											if(scr_check_archetype(field[i,0], 11)){
												fieldCard[i].cardStat[1] +=1;
												fieldCard[i].cardStat[2] +=1;
												fieldCard[i].cardStat[3] +=1;
												scr_message_field_card_stats(i);
												global.effect_successful = true;
											}
										}
									}
									if(global.effect_successful){
										momentum -= 3
										scr_message_stats()
									}
								}
							}
						break;
						case 2:
							with(obj_player){
								if(momentum >= 6){
									playerHP += 6
									global.effect_successful = true
									if(global.effect_successful){
										momentum -= 6
										obj_momentum_wheel.wheel_opt[wheelEffect] = true;										
										scr_message_stats()
									}
								}
							}
						break;
						case 3:
							with(obj_player){
								if(momentum >= 9){
									scr_impact_summon(9)
								}
							}
						break;
						case 4:
							with(obj_player){
								if(momentum >= 12){
									scr_destroy_target("all","all",0,13,"any","Heat Meter Wheel Effect 4",-1)
									if(global.effect_successful){
										momentum -= 12
										scr_message_stats()
									}
								}				
							}
						break;
					}
				break;	
			}
		}
	}


}
