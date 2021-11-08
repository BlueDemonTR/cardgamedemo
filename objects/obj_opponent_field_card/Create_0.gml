selected = false;

level1MarginX = -37
level1MarginY = -72.5

distanceLevel = 7

attacksLeft = 1;
player = obj_opponent
opponent = obj_player
animationType = "none"

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