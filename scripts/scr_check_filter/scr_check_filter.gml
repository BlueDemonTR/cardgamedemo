// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_filter(cardNum, filterNum){
	switch(int64(filterNum)){
		case -1: //any
			return true
		break;
		case 0: //Monster That Has A The Same Level As A Motorbiker Leader Monster In The Momentum Deck
			var levelTemp = macros.origStat[cardNum, StatLevel];
			for (var i = 0; i < obj_player.momentumDeckCount; i++){
				if(macros.origStat[obj_player.momentumDeck[i, 0], StatLevel] == levelTemp ){
					return true
				}
			}
			
		break;
		case 1: //Motorbiker Leader Monster That Has A Motorbiker Leader Monster With The Same Level As The Target
			if(variable_array_exists(macros.origStat, cardNum, StatLevel)){
				if (scr_check_archetype(cardNum, ArcMotorbikerLeader)){
					var levelTemp = macros.origStat[cardNum, StatLevel];
					return (macros.origStat[obj_player.infirmary[obj_player.resolutionPile[obj_player.resolutionPileCount-1,5],0],StatLevel] == levelTemp)
				}
			}		
		break;
		case 2: //Monster That Has A Level Higher Than The Monster With The Lowest Level On The Field That is also targetable
			for(i = 0; i < 5; i++){
				if((!obj_player.fieldCard[i].cardStatus[StatusSneaky] && obj_player.fieldCard[i].cardStat[StatLevel] < macros.origStat[cardNum, StatLevel]) || (!obj_opponent.fieldCard[i].cardStatus[StatusSneaky] && obj_opponent.fieldCard[i].cardStat[StatLevel] < macros.origStat[cardNum, StatLevel])){
					return true
				}
			}
		break;
		case 3: //Monster With Taunt
			return cardStatus[StatusTAUNT]
		break;
	}
	return false;
}