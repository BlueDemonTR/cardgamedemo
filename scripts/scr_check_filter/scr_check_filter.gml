// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_filter(cardNum, filterNum){
	switch(int64(filterNum)){
		case -1: //any
			return true
		break;
		case 0: //Motorbiker Card
			return (scr_check_archetype(cardNum, 0))
		break;
		case 1: //Level 2 or Lower Motorbiker Monster
			if(variable_array_exists(macros.origStat, cardNum, 0)){
				if(filterNum == 1.1){//If it can be summoned
					if (!scr_limited_summon(cardNum)){ return false; }
				}
				return (scr_check_archetype(cardNum, 0) && macros.origStat[cardNum,0] <= 2)	
			}
		break;
		case 2: //Motorbiker Leader Monster That Has A The Same Level As A Motorbiker Leader Monster In The Momentum Deck That is Legal To Summon
			if(variable_array_exists(macros.origStat, cardNum, 0)){
				if (scr_check_archetype(cardNum, 1)){
					var levelTemp = macros.origStat[cardNum,0];
					for (var i = 0; i < obj_player.momentumDeckCount; i++){
						if(macros.origStat[obj_player.momentumDeck[i,0],0] == levelTemp && scr_limited_summon(obj_player.momentumDeck[i,0])){
							return true
						}
					}
				}
			}
			
		break;
		case 3: //Motorbiker Leader Monster That Has A Motorbiker Leader Monster With The Same Level In The Target
			if(variable_array_exists(macros.origStat, cardNum, 0)){
				if (scr_check_archetype(cardNum, 1)){
					var levelTemp = macros.origStat[cardNum,0];
					return (macros.origStat[obj_player.infirmary[obj_player.resolutionPile[obj_player.resolutionPileCount-1,5],0],0] == levelTemp)
				}
			}		
		break;
		case 4: //Visclades Card
			if(filterNum == 4.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}		
			return (scr_check_archetype(cardNum, 3))
		break;
		case 5: //non-Momentum Visclades Monster
			return (scr_check_archetype(cardNum, 3) && !(macros.card_type[cardNum] == 1) && scr_limited_summon(cardNum))
		break;
		case 6: //Igloo Card
			return scr_check_archetype(cardNum, 5)
		break;
		case 7: //Pole Clan Card
			if(filterNum == 7.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}		
			return scr_check_archetype(cardNum, 4)
		break
		case 8: //Blizzard Card		
			return scr_check_archetype(cardNum, 6)
		break
		case 9: //Monster That Has A Level Higher Than The Monster With The Lowest Level On The Field
			if(macros.card_type[cardNum] == 0 || macros.card_type[cardNum] == 1){
				for(i = 0; i < 5; i++){
					if((!obj_player.fieldCard[i].cardStatus[6] && obj_player.fieldCard[i].cardStat[0] < macros.origStat[cardNum, 0]) || (!obj_opponent.fieldCard[i].cardStatus[6] && obj_opponent.fieldCard[i].cardStat[0] < macros.origStat[cardNum, 0])){
						return true
					}
				}	
			}
		break;
		case 10: //Motorbiker Leader
			if(filterNum == 10.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}			
			return scr_check_archetype(cardNum,1)
			
		break;
		case 11: //non-Momentum Monster
			return (macros.card_type[cardNum] == 0)
		break;	
		case 13: //Specifically "Igloo"
			if(filterNum == 13.1){//If it can be summoned
				if (!scr_limited_summon(cardNum)){ return false; }
			}
			return cardNum == 32
		break;

	}
	return false;
}