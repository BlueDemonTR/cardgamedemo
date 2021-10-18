// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_infirmary(players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, sendType, ignoreTarget, filterNum, arrayPos){
	/*
	players (enter all player objects that are affected in an array)
	typeArray (enter Types)
	Max Level (between 1-12)
	Min Level (between 1-12)
	Archetype Array (Checks if the card is a part of ANY of the archetypes in the array)
	Spirit Array
	Check Summonable
	Destroy Type
	ignoreTarget
	filterNum
	arrayPos
	*/
	var filteredCards,
	filteredCardCount = 0;
	
	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.infirmaryCount; j++){
			var cardNum = player.infirmary[j, 0],
			cardStat = macros.origStat[cardNum];
			
			if(array_length(typeArray) && !array_includes(typeArray, macros.card_type[cardNum])){
				continue;
			}
			if(cardStat[StatLevel] > maxLevel || cardStat[StatLevel] < minLevel){
				continue;
			}
			if(array_length(archetypeArray) && !array_includes_array(archetypeArray, macros.origArchetype[cardNum])){
				continue;
			}
			if(array_length(spiritArray) && !array_includes(spiritArray, cardStat[StatSpirit])){
				continue;
			}
			if(checkSummonable && !scr_limited_summon(cardNum)){
				continue;
			}
			if(sendType != -1 && player.infirmary[i,2] == sendType){
				continue;
			}
			if(j == ignoreTarget){
				continue;
			}
			if(!scr_check_filter(cardNum, j,filterNum)){
				continue;
			}
			filteredCards[filteredCardCount++] = [player, j]
		}
	}
	
	for (i = 0; i < filteredCardCount; i++){
		with(instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets)){
			self.player = filteredCards[i,0]
			position = filteredCards[i,1];
			self.arrayPos = arrayPos
			self.cardNum = self.player.infirmary[position, 0];
			self.artNum = self.player.infirmary[position,1];
			current_function = "infirmary";
		}
	}
	if(filteredCardCount == 0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}