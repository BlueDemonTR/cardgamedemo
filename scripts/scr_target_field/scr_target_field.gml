function scr_target_field(players, typeArray, level, atk, hp, archetypeArray, spiritArray, ignoreTarget, filterNum, arrayPos) {
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
	arrayPos
	*/
	var filteredCards,
	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.field_zone_count; j++){
			var cardNum = player.field[i, 0],
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
			filteredCards[filteredCardCount++] = [player, i]
		}
	}
	
	for (var i = 0; i < filteredCardCount; i++){
		with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
			self.player = filteredCards[i,0]
			position = filteredCards[i,1];
			self.arrayPos = arrayPos
			self.cardNum = self.player.field[position, 0];
			self.artNum = self.player.field[position, 1];
			x = player.field_card_zone_x[position];
			y = player.field_card_zone_y[position];
		}		
	}
	if(!filteredCardCount){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
		return false
	}
	return true
}