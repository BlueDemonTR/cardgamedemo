selected=false;


attacksLeft = 1;
player = obj_opponent
opponent = obj_player
animationType = "none"

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