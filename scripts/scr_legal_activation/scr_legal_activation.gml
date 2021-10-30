// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_legal_activation(cardNum, effectNum, player, position){
	
	if(effectNum == -1){return false}
	
	switch(cardNum){
		case "WheelGain":
			switch(position){
				case 1://Motorbiker Wheel Gain Legal Activation
				case 2://Visclades Wheel Gain Legal Activation
				case 3://Pole Clan Wheel Gain Legal Activation
				case 4://Sacrifice Wheel Gain Legal Activation
				case 5://Fisherman Wheel Gain Legal Activation
				case 6://Classic Wheel Gain Legal Activation
				case 7://XMakine Wheel Gain Legal Activation
					if(player.getStatus(PlayerLockWheel)){return false};
					return true;
				break;
			}
		break;
		case "WheelEffect":
			if(player.getStat(PlayerMomentum) < macros.wheel_cost[position, effectNum]){return false}
			switch(position){
				case 1://Motorbiker Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcMotorbiker], [], false, -1)){return false;}
							return true;							
						break;
						case 1:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 2:
							if(scr_find_deck(9) == -1){return false;}
							return true;
						break;
						case 3:
							if(scr_if_field_empty(player)){return false}
							return true;
						break;
					}
				break;
				case 2://Visclades Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(player.getStat(PlayerMana) == player.getStat(PlayerMaxMana)){return false}
							return true;							
						break;
						case 1:
							if(scr_find_deck(24) == -1){return false;}
							return true;
						break;
						case 2:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 3:
							if(!scr_count_field_filter([player.opponent], [], [1, 4], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
							return true;
						break;
					}				
				break;
				case 3://Pole Clan Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1) || !(scr_if_field_full(player) && scr_limited_summon(32) && scr_find_deck(32))){return false}
							return true;							
						break;
						case 1:
							if(!(scr_if_field_full(player) && scr_limited_summon(32) && scr_find_deck(32))){return false}
							return true;
						break;
						case 2:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 3:
							if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1)){return false}
							return true;
						break;
					}				
				break;
				case 4://Sacrifice Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcSacrifice], [], -1, -1)){return false}
							return true;
						break;
						case 1:
							if(scr_count_deck_filter([player], [], 1, 12, [ArcNightmareBeast], [], false, -1)){return false}
							return true;
						break;
						case 2:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 3:
							if(player.getStat(PlayerMana) == player.getStat(PlayerMaxMana)){return false}
							return true;
						break;
					}				
				break;
				case 5://Fisherman Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(!scr_count_deck_filter([player], [], 1, 12, [ArcFisherman], [], false, -1)){return false}
							return true;
						break;
						case 1:
							if(player.handCount < 5){return false}
							return true;
						break;
						case 2:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 3:
							if(scr_if_field_full(player) && scr_limited_summon(86)){return false}
							return true;
						break;
					}				
				break;
				case 6://Classic Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
							return true;
						break;
						case 1:
							return true;
						break;
						case 2:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 3:
							if(!scr_count_deck_filter([player], [TypeSpell], 1, 12, [], [], false, -1)){return false}
							return true;
						break;
					}				
				break;
				case 7://XMakine Wheel Wheel Effects Legal Activation
					switch(effectNum){
						case 0:
							if(player.getStat(PlayerMomentum) != 3){return false}
							if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
							return true;
						break;
						case 1:
							if(player.getStat(PlayerHP) == player.getStat(PlayerMaxHP)){return false}
							return true;
						break;
						case 2:
							if(!array_length(scr_count_impact(player))){return false}
							return true;
						break;
						case 3:
							if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
							return true;
						break;
					}				
				break;
			}
		break;
		case "SharedEffects":
			switch(effectNum){
				case SharedMotorbikerLeader:
				case SharedVisclades:
					return true;
				break;
				case SharedIgloo:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], position, -1)){return false}
					return true;
				break;
				case SharedXMakine:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					if(player.getStat(PlayerMomentum) == 0){return false}
					return true;
				break;
				case SharedUnderworldVisclades:
					if(!scr_count_infirmary_filter([player], [TypeMonster], 1, 12, [ArcVisclades], [], true, -1, -1, -1)){return false;}
					return true;
				break;
				case SharedSacrifice:
					if(!scr_if_field_full(player) && !scr_limited_summon(74)){return false}
					return true;
				break;
			}
		break;
		
		case "SelfDestruct": //Destroy During EP Legal Activation
		case "Poison"://Poison Legal Activation
		case "Regeneration"://Regeneration Legal Activation
		case 1://Motorbiker Showman Legal Activation
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
		case 55://Garbage Collector Legal Activation
		case 64://Lunar Tank Legal Activation
		case 65://Homesick Soldier Legal Activation
		case 69://Speed Soldier Legal Activation
		case 70://Vengeful Cyborg Legal Activation
		case 74://Useless Sacrifice Legal Activation
		case 99://Single Shot Master Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
		case 3://Motorbiker Wild Rider Legal Activation
		case 75://Wealthy Sacrifice Legal Activation
		case 91://Lucky Reel Legal Activation
		case 116://Reflection Legal Activation
			return true;
		break;
		
		case 85://Wise Fisherman Legal Activation
		case 87://Lucky Fisherman Legal Activation
		case 88://Strong Fisherman Legal Activation
		case 89://Naive Fisherman Legal Activation		
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!player.fieldCard[position].effectUsesLeft){return false}
			return true
		break;
		
		case 2://Motorbiker Doppelganger Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(scr_find_deck(2) == -1){return false;}
			return true;
		break;
				
		case 4://Motorbiker V-Rider Legal Activation
		case 5://Motorbiker D-Rider Legal Activation
		case 7://Motorbiker Protector Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcMotorbiker], [], -1, -1)){return false}
			return true;
		break;

		case 8://Rev up the Engines Legal Activation
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcMotorbiker], [], false, -1)){return false;}
			return true;
		break;
		
		case 9://Leader Takeover Legal Activation
			if(!scr_count_infirmary_filter([player], [TypeMomentum], 1, 12, [ArcMotorbiker], [], false, SendInjuries, -1, 0)){return false;}
			if(player.field[4,0] != 0){return false;}
			return true;
		break;
		
		case 10://The Hunt Is On Boys!! Activation
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcMotorbikerLeader], [], -1, -1)){return false}
			if(scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcMotorbiker], [], -1, -1) < 3) {return false}
			return true;
		break;
		
		case 11://Motorbiker Leader Khan Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(scr_if_field_full(player)){return false;}
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 2, [ArcMotorbiker], [], true, -1)){return false;}
			return true;
		break;
		
		case 12://Motorbiker Leader Luther Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player.opponent], [], [1, 4], [0, infinity], [0, infinity], [], [], -1, -1)){return false;}
			if(player.fieldCard[position].getStat(StatATK) == 0){return false;}
			return true;
		break;
		
		case 14://Motorbiker Leader Cleo Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!(player.fieldCard[position].effectUsesLeft)){return false}
			if(!scr_count_field_filter([player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false;}
			return true;
		break;
		
		case 16://EoS Legal Activation
			switch(effectNum){
				case 0:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					if(!scr_count_field_filter([player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false;}				
					return true;
				break;
				case 1:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					return true;
				break;
			}
		break;
		
		case 19://Visclades Idine Lib Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_limited_summon(argument[4])){return false;}
			return true;
		break;
		
		case 21://Visclades Luvies Ing Legal Activation
			switch(effectNum){
				case 0:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}				
					return true;
				break;
				case 1:
					if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcVisclades], [], -1, -1)){return false;}
					return true;
				break;
			}			
		break;
		
		case 22://Visclades Tia Invaden Lib Legal Activation
			if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			return true
		break;
		
		case 24://Cries from the Underworld Legal Activation
			if(!scr_count_momentum_deck_filter([player], 1, 12, [ArcVisclades], [], true, -1)){return false}
			if(scr_if_field_full(player)){return false;}
			if(scr_count_infirmary_filter([player], [], 1, 12, [ArcVisclades], [], false, -1, -1, -1) < 4){return false}
			return true
		break;
		
		case 25://Second Coming Legal Activation
			if(scr_if_field_full(player)){return false;}
			if(!scr_count_infirmary_filter([player], [TypeMonster], 1, 12, [ArcVisclades], [], true, -1, -1, -1)){return false}	
			return true;
		break;
		
		case 26://The Bloody Sacrifice Legal Activation
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcVisclades], [], false, -1)){return false}
			return true;
		break;
		
		case 27://Denial Visclades Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			return true;
		break;
		
		case 29://Bargaining Visclades Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}		
			if(!(player.getStat(PlayerMana) > 0 && player.getStat(PlayerHP) != player.getStat(PlayerMaxHP))){return false;}		
			return true;
		break;
		
		case 30://Depression Visclades Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field(player.opponent)){return false}
			return true;
		break;
		
		case 31://Acceptance Visclades Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_infirmary_filter([player], [], 1, 12, [ArcVisclades], [], false, -1, -1, -1)){return false}
			return true;
		break;
		
		case 33://Pole Clan Builder Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_deck_filter([player], [], 1, 12, [ArcIgloo], [], true, -1)){return false;}
			return true;
		break;
		
		case 35://Pole Clan Mage Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_card_hopt(cardNum, 0)){return false;}
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1)){return false}
			if(!scr_count_deck_filter([player], [TypeSpell], 1, 12, [ArcBlizzard], [], false, -1)){return false}
			return true;
		break;
		
		case 36://Pole Clan Defender Legal Activation
		case 37://Pole Clan Beast Legal Activation	
			switch(effectNum){
				case 0:
				case 1:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1)){return false}
					return true
				break;
			}
		
		case 39://Blizzard Icewall Legal Activation
			if(player.getStat(PlayerMomentum) < 1){return false}
			if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1)){return false}
			return true;
		break;
		
		case 40://Blizzard Icicle Storm Legal Activation
			if(player.getStat(PlayerMomentum) < 3){return false}
			if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1)){return false}
			return true;
		break;
		
		case 41://Blizzard Recruitment Legal Activation
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcPoleClan], [], false, -1)){return false}
			return true;
		break;
		
		case 42://Blizzard Hibernation Legal Activation
			if(player.getStat(PlayerMomentum) < 3){return false}
			return true;
		break;
		
		case 43://Blizzard Lockdown Legal Activation
			if(!scr_count_hand_filter([player], [TypeMonster], 1, 12, [], [], false, position, 2)){return false}
			return true;
		break;
		
		case 44://Blizzard Frost Beam Legal Activation
			if(player.getStat(PlayerMomentum) < 3){return false}
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcIgloo], [], -1, -1)){return false}
			return true;
		break;
		
		case 47://Igloo Castle Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(scr_if_field_full(player)){return false;}
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if(!scr_count_infirmary_filter([player], [], 1, 12, [ArcPoleClan], [], true, -1, -1, -1)){return false;}
			return true
		break;
		
		case 48://Igloo Citadel Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcPoleClan], [], -1, -1)){return false;}
			return true
		break;
		
		case 49://Igloo Kingdom Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if(scr_if_field_full(player) && !scr_limited_summon(34)){return false}
			return true;
		break;

		case 51://At Long Last... Legal Activation
			if(player.handCount < 1){return false}
			return true
		break;

		case 52://Centrifugal Reborn Legal Activation
			if(!scr_count_infirmary_filter([player], [TypeMonster, TypeMomentum], 1, player.getStat(PlayerMomentum), [], [], true, -1, -1, -1)){return false}
			return true	
		break;
		
		case 53://Healing Lullaby Legal Activation
			if(player.getStat(PlayerHP) == player.getStat(PlayerMaxHP) || !(player.getStat(PlayerMomentum))){return false;}
			return true
		break;
		
		case 54://Battle Medic Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_infirmary_filter([player], [TypeMonster, TypeMomentum], 1, 2, [], [], false, -1, -1, -1)){return false;}
			return true
		break;

		case 56://Earthquake Legal Activation
			if(scr_count_field(player) > scr_count_field(player.opponent)){return false}
			return true
		break;
		
		case 57://Power Discharge Legal Activation
			if(player.handCount < 1){return false}
			if(!scr_count_field_filter([player, player.opponent], [], [1,4], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			return true
		break;
		
		case 58://Man With A Shield Legal Activation
			if(scr_if_field_full(player)){ return false }
			return true
		break;
		
		case 60://Great Leader Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(scr_if_field_full(player) || player.handCount < 1 || !scr_limited_summon(61)){return false}	
			return true
		break;		

		case 61://Bodyguard Legal Activation
			switch(effectNum){
				case 0:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					if(!scr_if_you_control(60)){return false}
					return true
				break;
				case 1:
					if(!scr_if_you_control(60)){return false}					
					return true;
				break;
			}
		break

		case 62://Awoken Civillian
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if(scr_if_field_full(player) || !scr_limited_summon(63)){return false}	
			return true
		break;
		
		case 63://Rebellion Ally Legal Activation
			switch(effectNum){
				case 0:
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					if(!scr_if_you_control(62)){return false}
					return true
				break;
				case 1:
					if(!scr_if_you_control(62)){return false}					
					return true;
				break;
			}
		break;
		
		case 66://Bloodthirst Legal Activation
			if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [SpiritAggressive, SpiritMalicious], -1, -1)){return false}
			return true
		break;
		
		case 96://Fullteam Medics Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
		case 67://Pan Soldier Legal Activation
			if(player.getStat(PlayerHP) == player.getStat(PlayerMaxHP)){return false;}
			return true
		break;
		
		case 68://Machine Gun Soldiers Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field(player.opponent)){return false}
			return true
		break;
		
		case 71://Armed Civillian Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			return true
		break;
		
		case 72://er Legal Actiavation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(player.deckCount < 3){return false;}
			return true
		break;
		
		case 73://Baby Phoenix Legal Activation
			if(scr_if_field_full(player)){return false;}
			if(player.getStat(PlayerMana) < 2){return false;}
			return true
		break;
		
		case 76://Ruthless Sacrifice Legal Activation
			if(!scr_count_field_filter([player.opponent], [], [1,4], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			return true
		break;
		
		case 77://Cursed Sacrifice Legal Activation
			if(!scr_count_infirmary_filter([player], [TypeMonster, TypeMomentum], 5, 12, [], [], true, -1, -1, -1)){return false}
			return true
		break;
		
		case 78://Genesis Notebook Legal Activation
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcSacrifice], [], -1, -1)){return false}
			if(!scr_count_deck_filter([player], [TypeMonster], 5, 12, [], [], false, -1)){return false}
			return true
		break;		
		
		case 79://Gatherings of the Accursed Legal Activation
			if(scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcSacrifice], [], -1, -1) < 2){return false}
			return true
		break;
		
		case 80://Silent Courage Legal Activation
			if(!scr_count_field_filter([player, player.opponent], [], [1, 12], [0, infinity], [0, infinity], [ArcSacrifice], [], -1, -1)){return false}
			return true
		break;
		
		case 81://Nightmare Beast Crystal Echo Legal Activation
		case 82://Nightmare Beast Conductrons Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			return true
		break;
		
		case 83://Fisherman Rookie Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if(scr_if_field_full(player)){return false}
			if(!scr_limited_summon(85)){return false}
			return true;
		break;
		
		case 86://Goldfish Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player], [], [1,12], [0, infinity], [0, infinity], [ArcFisherman], [], -1, -1)){return false}
			return true
		break;
		
		case 90://Fisherman of the Oceans Legal Activation
			switch(effectNum){
				case 0://Summon Foishi
					if(!player.fieldCard[position].effectUsesLeft){return false}
					if(scr_if_field_full(player)){return false}
				case 1://Get Stat (from foishi)	
					if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
					return true				
				break;
			}
		break;
		
		case 92://Cursed Reel Legal Activation
			if(player.getStat(PlayerMomentum) < 1){return false}
			return true
		break;
		
		case 93://Marketplace of the Oceans Legal Activation
			if(scr_count_infirmary_name(player, 84, -1) < 5 && !scr_count_infirmary_name(player, 86, -1)){return false}
			return true
		break;
		
		case 94://Highest Bidder Legal Activation
			if(!scr_count_infirmary_name(player, 86, -1)){return false}
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcFisherman], [], false, -1)){return false}
			return true
		break;
		
		case 100://Desperate Power Measures Legal Activation
			if(!scr_count_hand_filter([player], [TypeMonster], 1, 12, [], [], false, position, -1)){return false}
			return true
		break;
		
		case 101://Rogue Soldier Legal Activation
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_hand_filter([player], [], 1, 12, [], [], false, position, -1)){return false}
			return true
		break;
		
		case 107://X-Makine Casey Legal Activation
		case 108://X-Makine Theo Legal Activation
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(player.getStat(PlayerMomentum) > 3){return false}
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], position, -1)){return false}
			return true;		
		break;
		
		case 109://X-Makine Lily Legal Activation
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(player.getStat(PlayerMomentum) > 0){return false}
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcXMakine], [], false, -1)){return false}
			return true;
		break;
		
		case 110://X-Makine Robert Legal Activation
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(player.getStat(PlayerMomentum) > 3){return false}
			if(!scr_count_infirmary_filter([player], [TypeMonster, TypeMomentum], 1, 12, [ArcXMakine], [], false, -1, -1, -1)){return false}
			return true;
		break;
		
		case 111://X-Makine Dom Legal Activation
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(player.getStat(PlayerMomentum) > 3){return false}
			if(!scr_count_field_filter([player], [], [1, 11], [0, infinity], [0, infinity], [ArcXMakine], [], position, -1)){return false}
			return true;
		break;

		case 112://DX-Makine Jason Legal Activation
			if(!player.fieldCard[position].effectUsesLeft){return false}
			if((instance_exists(player.fieldCard[position]) && player.fieldCard[position].getStatus(StatusSilenced))){return false;}
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){ return false }
			return true
		break;
		
		case 113://Emergency Call Legal Activation
			if(scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], -1, -1) != 1){return false}
			if(!scr_count_field_filter([player.opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			if(scr_if_field_full(player)){return false}
			if(!scr_count_deck_filter([player], [TypeMonster], 1, 12, [ArcXMakine], [], true, -1)){return false}
			return true;
		break;
		
		case 114://Mighty Charging Fire Blades Legal Activation
			if(!scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], -1, -1)){return false}
			return true;
		break;
		
		case 115://X-Makines Form Together Legal Activation
			if(scr_count_field_filter([player], [], [1, 12], [0, infinity], [0, infinity], [ArcXMakine], [], -1, -1) < 2){return false}
			if(!scr_count_field_filter([player.opponent], [TypeMomentum], [1, 12], [0, infinity], [0, infinity], [], [], -1, -1)){return false}
			if(scr_count_momentum_deck_filter([player], 1, 12, [ArcXMakine], [], true, -1)){return false}
			return true;
		break;
	}
}