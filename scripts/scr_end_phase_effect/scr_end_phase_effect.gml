// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_end_phase_effect(argument0){
	var cardNum = argument0;
	switch(cardNum){
		case "X-Makine Shared Effect":
			
			momentum = max(momentum-3,0);
			scr_message_stats()
			obj_player.endPhaseChainCount--
			return;
		break;
		case 16:
			var j = 0;
			with(fieldCard[endPhaseChains[endPhaseChainCount-1,2]]){
				if((position == 4 || obj_player.field[4,0] == 0) && !cardis_silenced){
					for(var i = 0; i < player.momentumDeckCount; i++){
						if(scr_limited_summon(player.momentum_deck[i,0]) && scr_check_archetype(player.momentum_deck[i,0], 2) && macros.origStat[player.momentum_deck[i,0],0] = 4){
							global.filtered_cards[j++] = i;				
						}
					}
					filtered_card_count = j;
					if (filtered_card_count > 0){
						for (var i = 0; i < filtered_card_count; i++){
							legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
							with(legal_targets[i]){
								placeInMomentumDeck = global.filtered_cards[i];
								self.cardNum = obj_player.momentum_deck[placeInMomentumDeck];
								current_function = "freeImpact";
								effectBelongsTo=cardNum;

							}
						}
					}else{
						obj_player.endPhaseChainCount--
						return;
					}
				}else{
					obj_player.endPhaseChainCount--
					return;
				}
				scr_destroy(position);	
			}

		break;
		case 19:
			//remove later
			//if(!fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardis_silenced){
			//	for(i = 0; i < opponent.infirmaryCount; i++){
					
			//		if (obj_opponent.infirmary[i] == endPhaseChains[endPhaseChainCount-1,3]){
			//			test()
			//			var summoned_card = obj_opponent.imfirmay[i]
			//			for(var k=0;k<4;k++){
			//				if(field[k] == 0){
			//					var
			//					sprite = macros..sprite_array[summoned_card],
			//					temp1 = summoned_card,
			//					temp2 = k;										
			//					fieldCard[k] = instance_create_depth(field_card_zone_x[k],field_card_zone_y[k], 1, obj_field_card);

			//					scr_message_field(temp2, temp1, "none");
			//					with(fieldCard[k]){
			//						summoning_method = "effect"
			//						player = obj_player;
			//						self.cardNum = temp1;
			//						self.position = temp2;
			//						scr_info_to_instance(temp1);
			//						cardis_silenced = true;
			//						cardmaxHP = max_hp[temp1];
			//						cardatk = atk[temp1];
			//						cardlevel = level[temp1];
			//						cardhas_taunt = false;
			//						cardhas_super_taunt = false;
			//						cardhas_pierce = false;
			//						cardhas_rebellious = false;
			//						cardhas_unaffected = false;
			//						cardhas_indestructable = false;
			//						cardhas_lifesteal = false;
			//						cardhas_sneaky = false;
			//						cardhas_unarmed = false
			//						cardhas_ranged = false;
			//						cardis_paralyzed = false;
			//						cardis_poisoned = false;
			//						cardarmor = 0;
			//						cardregeneration = 0;
			//						carddodge = 0;
			//						silence_reset = true;											
			//						field_x = player.field_card_zone_x[self.position];
			//						field_y = player.field_card_zone_y[self.position];
			//						sprite_index = sprite;
			//					}
			//					field[k]= temp1;
			//					mid_effect=false;
			//					break;
			//				} 
			//			}
			//			with(obj_opponent){
			//				scr_remove_from_infirmary(i)
			//			}
							
			//		}
			//	}
			//}
			//endPhaseChainCount--
			//return;
			
			
		break;
		case 34:
			if !fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced] scr_burn(opponent,3,34)
			endPhaseChainCount--
			return;			
		break;
		case 36:
			if !fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced] scr_burn(opponent,2,36)		
			endPhaseChainCount--
			return;				
		break;
		case 38:
			if !fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced] scr_burn(opponent,1,38)	
			endPhaseChainCount--
			return;				
		break;
		case 56:
			for(var j=0; j < 5; j++){
				if(field[j,0] > 0){
					scr_bounce(j);
					momentum += 2
					scr_message_stats();
				}
				if(opponent.field[j,0] > 0){
					with(opponent){
						scr_bounce(j);
						momentum += 2
						scr_message_opponent_stats();
					}
				}
			}
			endPhaseChainCount--
			return;
		break;		
		case 72:
			if (!fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStatus[StatusSilenced]){
				scr_mill_from_top(3)
				fieldCard[endPhaseChains[endPhaseChainCount-1,2]].cardStat[StatATK] += 3;
				scr_message_field_card_stats(endPhaseChains[endPhaseChainCount-1,2])	
			}
			endPhaseChainCount--;
			return;
		break;
		case "destroyDuringEP":
			scr_destroy(endPhaseChains[endPhaseChainCount-1,2]);
			endPhaseChainCount--;
			return;			
		break;
	}
}