function scr_count_field_filter(players, typeArray, level, atk, hp, archetypeArray, spiritArray, ignoreTarget, filterNum) {
	/*
	players (enter all player objects that are affected in an array)
	typeArray
	Level [min, max]
	ATK Min/ Array [min, max]
	HP Min/ Array [min, max]
	Archetype Array (Checks if the card is a part of ANY of the archetypes in the array)
	Spirit Array
	ignoreTarget [player, position]
	filterNum
	*/
	var 
	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.field_zone_count; j++){
			var cardNum = player.field[i, CardNumber],
			card = player.fieldCard[j],
			cardStat = card.cardStat;
			
			if(macros.card_type[cardNum] != TypeSpell && (cardStat[StatLevel] < level[0] || cardStat[StatLevel] > level[1])){
				continue;
			}
			if(cardStat[StatATK] < atk[0] || cardStat[StatATK] > atk[1]){
				continue;
			}
			if(cardStat[StatHP] < hp[0] || cardStat[StatHP] > hp[1]){
				continue;
			}
			if(typeArray != [] && !array_includes(typeArray, macros.card_type[cardNum])){
				continue;
			}
			if(archetypeArray != [] && !array_includes_array(archetypeArray, card.cardArchetype)){
				continue;
			}
			if(spiritArray != [] && !array_includes(spiritArray, cardStat[StatSpirit])){
				continue;
			}
			if(ignoreTarget == [player, j]){
				continue;
			}
			if(!scr_check_filter(cardNum, filterNum)){
				continue;
			}
			filteredCardCount++
		}
	}
	
	return filteredCardCount

}