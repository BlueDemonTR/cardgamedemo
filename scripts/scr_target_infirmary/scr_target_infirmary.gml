// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_infirmary(players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, destroyType, filterNum, arrayPos){
	/*
	players (enter all player objects that are affected in an array)
	typeArray (enter Types)
	Max Level (between 1-12)
	Min Level (between 1-12)
	Archetype Array (Checks if the card is a part of ANY of the archetypes in the array)
	Spirit Array
	Check Summonable
	Destroy Type
	filterNum
	arrayPos
	*/
	var filterCounter = 0,
	filteredCards,
	filteredCardCount = 0;
	
	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.infirmaryCount; j++){
			var cardNum = player.infirmary[i,0],
			cardStat = macros.origStat[cardNum];
			
			if(typeArray != [] && !array_includes(typeArray, macros.card_type[cardNum])){
				continue;
			}
			if(cardStat[StatLevel] > maxLevel || cardStat[StatLevel] < minLevel){
				continue;
			}
			if(archetypeArray != [] && !array_includes_array(archetypeArray, macros.origArchetype[cardNum])){
				continue;
			}
			if(spiritArray != [] && !array_includes(spiritArray, cardStat[StatSpirit])){
				continue;
			}
			if(checkSummonable && !scr_limited_summon(cardNum)){
				continue;
			}
			if(destroyType != -1 && player.infirmary[i,2] == destroyType){
				continue;
			}
			if(!scr_check_filter(cardNum, filterNum)){
				continue;
			}
			filteredCards[filteredCardCount++] = [player, i]
		}
	}
	
	for (i = 0; i < filteredCardCount; i++){
		with(instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets)){
			self.player = player
			position = filteredCards[i];
			self.arrayPos = arrayPos
			self.cardNum = obj_player.infirmary[position,0];
			self.artNum = obj_player.infirmary[position,1];
			current_function = "infirmary";
		}
	}
	if(filteredCardCount == 0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}