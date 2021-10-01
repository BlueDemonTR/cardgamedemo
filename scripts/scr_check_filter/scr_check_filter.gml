// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_filter(cardNum, filterNum){
	switch(int64(filterNum)){
		case -1: //any
			return true
		break;
		case 0: //Motorbiker Card
			return (scr_check_archetype(cardNum, ArcMotorbiker))
		break;
		case 1: //Level 2 or Lower Motorbiker Monster
			if(variable_array_exists(macros.origStat, cardNum, StatLevel)){
				if(filterNum == 1.1){//If it can be summoned
					if (!scr_limited_summon(cardNum)){return false;}
				}
				return (scr_check_archetype(cardNum, ArcMotorbiker) && macros.origStat[cardNum,StatLevel] <= 2)	
			}
		break;
		case 2: //Motorbiker Leader Monster That Has A The Same Level As A Motorbiker Leader Monster In The Momentum Deck That is Legal To Summon
			if(variable_array_exists(macros.origStat, cardNum, StatLevel)){
				if(scr_check_archetype(cardNum, ArcMotorbiker)){
					var levelTemp = macros.origStat[cardNum, StatLevel];
					for (var i = 0; i < obj_player.momentumDeckCount; i++){
						if(macros.origStat[obj_player.momentumDeck[i,0], StatLevel] == levelTemp && scr_limited_summon(obj_player.momentumDeck[i,0])){
							return true
						}
					}
				}
			}
			
		break;
		case 3: //Motorbiker Leader Monster That Has A Motorbiker Leader Monster With The Same Level In The Target
			if(variable_array_exists(macros.origStat, cardNum, StatLevel)){
				if (scr_check_archetype(cardNum, ArcMotorbikerLeader)){
					var levelTemp = macros.origStat[cardNum, StatLevel];
					return (macros.origStat[obj_player.infirmary[obj_player.resolutionPile[obj_player.resolutionPileCount-1,5],0],StatLevel] == levelTemp)
				}
			}		
		break;
		case 4: //Visclades Card
			if(filterNum == 4.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}		
			return (scr_check_archetype(cardNum, ArcVisclades))
		break;
		case 5: //non-Momentum Visclades Monster
			return (scr_check_archetype(cardNum, ArcVisclades) && !(macros.card_type[cardNum] == TypeMomentum) && scr_limited_summon(cardNum))
		break;
		case 6: //Igloo Card
			return scr_check_archetype(cardNum, ArcIgloo)
		break;
		case 7: //Pole Clan Card
			if(filterNum == 7.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}		
			return scr_check_archetype(cardNum, ArcPoleClan)
		break
		case 8: //Blizzard Card		
			return scr_check_archetype(cardNum, ArcBlizzard)
		break
		case 9: //Monster That Has A Level Higher Than The Monster With The Lowest Level On The Field That is also targetable
			if(macros.card_type[cardNum] != TypeSpell){
				for(i = 0; i < 5; i++){
					if((!obj_player.fieldCard[i].cardStatus[StatusSneaky] && obj_player.fieldCard[i].cardStat[StatLevel] < macros.origStat[cardNum, StatLevel]) || (!obj_opponent.fieldCard[i].cardStatus[StatusSneaky] && obj_opponent.fieldCard[i].cardStat[StatLevel] < macros.origStat[cardNum, StatLevel])){
						return true
					}
				}	
			}
		break;
		case 10: //Motorbiker Leader
			if(filterNum == 10.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}			
			return scr_check_archetype(cardNum, ArcMotorbikerLeader)
			
		break;
		case 11: //non-Momentum Monster
			return (macros.card_type[cardNum] == TypeMonster)
		break;
		case 12: //Level 4 or Lower Monster
			return (macros.origStat[cardNum, StatLevel] <= 4)
		break;
		case 13: //Specifically "Igloo"
			if(filterNum == 13.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}
			return cardNum == 32
		break;
		case 14: //Monster That Has A Lower Level Than or Equal to the Players' Momentum
			if(filterNum == 14.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}
			return macros.origStat[cardNum, StatLevel] <= obj_player.momentum
		break;
		case 15: //Level 2 or lower Monster
			return macros.origStat[cardNum, StatLevel] <= 2
		break;
		case 16: //Level 5 or higher Monster
			return macros.origStat[cardNum, StatLevel] >= 5
		break;
		case 17: //Sacrifice Monster
			return (scr_check_archetype(cardNum, ArcSacrifice))
		break;
		case 18: //Monster
			return (macros.card_type != TypeSpell)
		break;
		case 19: //X-Makine Monster
			if(filterNum == 19.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}		
			return (scr_check_archetype(cardNum, ArcXMakine))
		break;
		case 20: //Momentum 
			return macros.card_type[cardNum] == TypeMomentum
		break;
		case 21: //Fisherman Monster
			if(filterNum == 21.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}		
			return (scr_check_archetype(cardNum, ArcFisherman))		
		break;
	}
	return false;
}