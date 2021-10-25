depth = 1

selected=false;

position = -1;
cardNum = 0;
artNum = 0;

recruit = false;

player = obj_player
opponent = obj_opponent

animationType = "none"

alarm[1] = 10;

getStat = function(stat){
	if(array_length(cardStat) >= stat){
		return cardStat[stat]
	}else{
		return macros.defaultStat[stat]
	}	
}
getStatus = function(status){
	if(array_length(cardStatus) >= status){
		return cardStatus[status]
	}else{
		return macros.defaultStatus[status]
	}	
}