// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_legal_activation(cardNum, effectNum, position){
	var location = object_get_name(object_index)
	switch(cardNum){
		case "WheelGain":
			switch(effectNum){
				case 1:
				case 2:
				case 3:
				case 4:
				case 5:
				case 6:
				case 7:
					if(obj_player.wheel_locked == true){return false};
					return true;
				break;
			}
		break;
		case "SharedEffects":
			switch(effectNum){
				case 3:
				case 6:
					return true;
				break;
				case 7:
					if(obj_player.momentum == 0){return false}
					return true;
				break;
				case 4:
					if(scr_count_infirmary_filter(player, 5, "any") == 0){return false;}
					return true;
				break;
				case 5:
					if(scr_if_field_full(player) && !scr_limited_summon(74)){return false}
					return true;
				break;	
			}
		break;
		case 1: //Motorbiker Showman Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			return true;
		break;
		
		case 2://Motorbiker Doppelganger Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if (!scr_find_deck(2)){return false;}
			return true;
		break;
		
		case 3://Motorbiker Wild Rider Legal Activation
			return true;
		break;
		

		
		case 4://Motorbiker V-Rider Legal Activation
		case 5://Motorbiker D-Rider Legal Activation
		case 7://Motorbiker Protector Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_count_field_filter(player, 0, false) == 0){return false}
			return true;
		break;

		case 6://Motorbiker Violent Wheeler Legal Activation
		case 13://Motorbiker Leader Toku Legal Activation
		case 15://Motorbiker Leader Ceasar Legal Activation
		case 17://Visclades Lentus Vio Legal Activation
		case 18://Visclades Riti Ava Legal Activation
		case 20://Visclades Satio Ces Legal Activation
		case 23://Visclades Gloria Fastus Legal Activation
		case 28://Anger Visclades Legal Activation
		case 34://Pole Clan Archer Legal Activation		
		case 38://Pole Clan Torch Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			return true;
		break;

		case 8://Rev up the Engines Legal Activation
			if (scr_count_deck_filter(0) == 0){return false;}
			return true;
		break;
		
		case 9://Leader Takeover Legal Activation
			if (scr_count_infirmary_filter(player, 2, 0) == 0){return false;}
			if (field[4] != 0){return false;}
			return true;
		break;
		
		case 10://The Hunt Is On Boys!! Activation
			if (!scr_if_you_control_filter(10)){return false}
			if (scr_count_field_filter(player, 0, false) < 3) {return false}
			return true;
		break;
		
		case 11://Motorbiker Leader Khan Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if (scr_if_field_full(player)){return false;}
			if (scr_count_deck_filter(1.1) == 0){return false;}
			return true;
		break;
		
		case 12://Motorbiker Leader Luther Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if (scr_count_field_filter(opponent, 11, true) == 0){return false;}
			if (cardStat[StatATK] == 0){return false;}
			return true;
		break;
		
		case 14://Motorbiker Leader Cleo Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if (scr_count_field_filter(opponent, 11, true) == 0){return false;}
			return true;
		break;
		
		case 16://EoS Legal Activation
			switch(effectNum){
				case 0:
					if (cardStatus[StatusSilenced]){return false;}
					if (scr_count_field_filter(opponent, 11, true) == 0){return false;}				
					return true;
				break;
				case 1:
					if (cardStatus[StatusSilenced]){return false;}
					return true;
				break;
			}
		break;
		
		case 19://Visclades Idine Lib Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if (!scr_limited_summon(destroyedMonster)){return false;}
			return true;
		break;
		
		case 21://Visclades Luvies Ing Legal Activation
			switch(effectNum){
				case 0:
					if (cardStatus[StatusSilenced]){return false;}				
					return true;
				break;
				case 1:
					if (scr_count_field_filter(player, 4, true) == 0){return false;}
					return true;
				break;
			}			
		break;
		
		case 22://Visclades Tia Invaden Lib Legal Activation
			if(scr_count_field_filter(player, 11, true) + scr_count_field_filter(opponent, 11, true) == 0){return false}
			return true
		break;
		
		case 24://Cries from the Underworld Legal Activation
			if(scr_count_momentum_deck_filter(4.1) == 0){return false}
			if(scr_if_field_full(player)){return false;}
			if(scr_count_infirmary_filter(player, 4, "any") < 4){return false}
			return true
		break;
		
		case 25://Second Coming Legal Activation
			if(scr_if_field_full(player)){return false;}
			if(scr_count_infirmary_filter(player, 5, "any") == 0){return false}	
			return true;
		break;
		
		case 26://The Bloody Sacrifice Legal Activation
			if(scr_count_deck_filter(4) == 0){return false}
			return true;
		break;
		
		case 27://Denial Visclades Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_count_field_filter(opponent, -1, true)){return false}
			return true;
		break;
		
		case 29://Bargaining Visclades Legal Activation
			if (cardStatus[StatusSilenced]){return false;}		
			if(!(obj_player.mana > 0 && obj_player.playerHP != obj_player.playerMaxHP)){return false;}		
			return true;
		break;
		
		case 30://Depression Visclades Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_count_field(opponent) == 0){return false}
			return true;
		break;
		
		case 31://Acceptance Visclades Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_count_infirmary_filter(player, 4, "any") == 0){return false}
			return true;
		break;
		
		case 33://Pole Clan Builder Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_count_deck_filter(13))
		break;
		
		case 35://Pole Clan Mage Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_count_field_filter(player, 13, false) == 0){return false}
			if(scr_count_deck_filter(8) == 0){return false}
			return true;
		break;
		
		case 36://Pole Clan Defender Legal Activation
		case 37://Pole Clan Beast Legal Activation	
			switch(effectNum){
				case 0:
				case 1:
					if (cardStatus[StatusSilenced]){return false;}
					if(scr_count_field_filter(player, 6, false) == 0){return false}
					return true
				break;
			}
		
		case 39://Blizzard Icewall Legal Activation
			if(player.momentum < 1){return false}
			if(scr_count_field_filter(player, 6, true) + (scr_count_field_filter(opponent, 6, true) == 0)){return false}
			return true;
		break;
		
		case 40://Blizzard Icicle Storm Legal Activation
			if(player.momentum < 3){return false}
			if(scr_count_field_filter(player, 6, true) + (scr_count_field_filter(opponent, 6, true) == 0)){return false}
			return true;
		break;
		
		case 41://Blizzard Recruitment Legal Activation
			if(scr_count_deck_filter(7) == 0){return false}
			return true;
		break;
		
		case 42://Blizzard Hibernation Legal Activation
			if(player.momentum < 3){return false}
			return true;
		break;
		
		case 43://Blizzard Lockdown Legal Activation
			if(scr_count_hand_filter(9, hand_position) == 0){return false}
			return true;
		break;
		
		case 44://Blizzard Frost Beam Legal Activation
			if(!scr_if_you_control(35)){return false}
			return true;
		break;
		
		case 47://Igloo Castle Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if(scr_if_field_full(player)){return false;}
			if(scr_count_infirmary_filter(player, 7.1, "any") == 0){return false;}
			return true
		break;
		
		case 48://Igloo Citadel Legal Activation
			if (cardStatus[StatusSilenced]){return false;}
			if (scr_count_field_filter(player, 7, false) == 0){return false;}
			return true
		break;
		
		case 49://Igloo Kingdom Legal Activation
			if(scr_if_field_full() && !scr_limited_summon(34)){return false}
			return true;
		break;
		
		case 60:
			if(!scr_if_field_full() && obj_player.handCount > 0 && scr_limited_summon(61)){
				return true
			}	
			return false		
		break;
		case 62:
			if(!scr_if_field_full() && scr_limited_summon(63)){
				return true
			}	
			return false		
		break;		
		case 79:
			if(obj_opponent.handCount > 0 && obj_player.handCount > 0){
				return true
			}
			return false
		break;
		case 80:
			if(obj_player.handCount > 0){
				for(i = 0; i < 5; i++){
					if(obj_player.field[i] > 0){
						if(!obj_player.fieldCard[i].cardStatus[StatusSneaky]){ 
							return true
						}
					}
					if(obj_opponent.field[i] > 0){
						if(!obj_opponent.fieldCard[i].cardStatus[StatusSneaky]){
							return true
						}
					}
				}
			}
			return false
		break;
		case 81:
			if(obj_opponent.momentum > 0){
				return true;
			}
			return false;
		break;	
		case 82:
			if(obj_opponent.deckCount > 0){
				return true;
			}
			return false
		break;
		case 83:		
		case 85:		
		case 87:
		case 88:
		case 89:
		case 90:
			if(!scr_if_field_full() && scr_limited_summon(85)){
				return true
			}	
			return false
		break;
		case 107://X-makine casey, theo and dom
		case 108:
		case 111:
			if(obj_player.momentum <= 3){
				for(i = 0; i < 5; i++){
					if(i = position){continue}
					if(scr_check_archetype(obj_player.field[i,0], ArcXMakine)){
						return true
					}
				}
			return false;
			}
		break;
		case 109://x-makine lily
			if(obj_player.momentum <= 0){
				for(var i = 0; i < obj_player.deckCount; i++){
					if(scr_check_archetype(obj_player.deck[i,0], ArcXMakine)){
						return true;
					}
				}
			}
			return false;
		break;
		case 110://X-makine robert
			if(obj_player.momentum <= 3){
				for(var i = 0; i < obj_player.infirmaryCount; i++){
					if(scr_check_archetype(obj_player.infirmary[i,0], ArcXMakine)){
						return true;
					}
				}
			}
			return false;			
		break;
		case 112://DX-Makine Jason
			if(obj_player.momentum <= 6){
				for(i=0; i < 5; i++){
					if(obj_opponent.field[i,0] != 0){
						if(!obj_opponent.fieldCard[i].cardStatus[StatusSneaky]){
							return true
						}
					}
				}
			}else{
				return true
			}
			return false
		break;
	}
	return false;
}