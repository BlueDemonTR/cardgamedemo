// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_hand_filter(players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, ignoreTarget, filterNum){
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
	*/	
	var	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.handCount; j++){
			var cardNum = player.hand[j,0],
			cardStat = scr_get_stat_orig;
			
			if(macros.card_type[cardNum] != TypeSpell && (cardStat(cardNum, StatLevel) > maxLevel || cardStat(cardNum, StatLevel) < minLevel)){
				continue;
			}
			if(array_length(typeArray) && !array_includes(typeArray, macros.card_type[cardNum])){
				continue;
			}
			if(array_length(archetypeArray) && !array_includes_array(archetypeArray, macros.origArchetype[cardNum])){
				continue;
			}
			if(array_length(spiritArray) && !array_includes(spiritArray, cardStat(cardNum, StatSpirit))){
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
			filteredCardCount++
		}
	}

	return filteredCardCount
}