depth = 599

selected = false;

position = -1;
cardNum = 0;
artNum = 0;

recruit = false;

level1MarginX = -41
level1MarginY = -82.5

distanceLevel = 7

player = obj_player
opponent = obj_opponent

animationType = "none"

alarm[1] = 10;


cardStat = []
getStat = function(stat){
	if(array_length(cardStat) > stat){
		return cardStat[stat]
	}
	return macros.defaultStat[stat]	
}

cardStatus = []
getStatus = function(status){
	if(array_length(cardStatus) > status){
		return cardStatus[status]
	}
	return macros.defaultStatus[status]	
}

attacksLeft = 0