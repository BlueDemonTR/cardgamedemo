// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_hand(players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, ignoreTarget, filterNum, arrayPos){
	/*
	players (enter all player objects that are affected in an array)
	typeArray
	Max Level (between 1-12)
	Min Level (between 1-12)
	Archetype Array (Checks if the card is a part of ANY of the archetypes in the array)
	Spirit Array
	Check Summonable
	ignoreTarget
	filterNum
	arrayPos
	*/	
	var filteredCards,
	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.handCount; j++){
			var cardNum = player.hand[j, 0],
			cardStat = macros.origStat[cardNum];
			
			if(macros.card_type[cardNum] != TypeSpell && (cardStat[StatLevel] > maxLevel || cardStat[StatLevel] < minLevel)){
				continue;
			}
			if(array_length(typeArray) && !array_includes(typeArray, macros.card_type[cardNum])){
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
			if(ignoreTarget == [player, j]){
				continue;
			}			
			if(!scr_check_filter(cardNum, j,filterNum)){
				continue;
			}
			filteredCards[filteredCardCount++] = [player, j]
		}
	}

	for (var i=0; i < filteredCardCount; i++){
		with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
			self.player = filteredCards[i,0]
			position = filteredCards[i,1];
			self.arrayPos = arrayPos
			self.cardNum = self.player.deck[position, 0];
			self.artNum = self.player.deck[position, 1];
			current_function = "hand";
			x = player.handCard[i].x
			y = player.handCard[i].y
		}
		
	}

	if(filteredCardCount == 0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}