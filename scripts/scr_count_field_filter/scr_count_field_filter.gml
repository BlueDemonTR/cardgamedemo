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
			if(!player.field[j, 0]){continue;}
			
			var cardNum = player.field[i, 0],
			card = player.fieldCard[j],
			cardStat = card.getStat;
			
			if(macros.card_type[cardNum] != TypeSpell && (cardStat(StatLevel) < level[0] || cardStat(StatLevel) > level[1])){
				continue;
			}
			if(cardStat(StatATK) < atk[0] || cardStat(StatATK) > atk[1]){
				continue;
			}
			if(cardStat(StatHP) < hp[0] || cardStat(StatHP) > hp[1]){
				continue;
			}
			if(array_length(typeArray) && !array_includes(typeArray, macros.card_type[cardNum])){
				continue;
			}
			if(array_length(archetypeArray) && !array_includes_array(archetypeArray, card.cardArchetype)){
				continue;
			}
			if(array_length(spiritArray) && !array_includes(spiritArray, cardStat(StatSpirit))){
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