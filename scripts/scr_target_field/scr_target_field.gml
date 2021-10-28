function scr_target_field(activator, players, typeArray, level, atk, hp, archetypeArray, spiritArray, ignoreTarget, filterNum, arrayPos) {
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
	
	if(activator == obj_opponent){
		scr_message_ask_response(RESPONSE_TARGET_FIELD, players, typeArray, level, atk, hp, archetypeArray , spiritArray, ignoreTarget, filterNum, arrayPos)
		return;
	}
	
	var filteredCards,
	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.field_zone_count; j++){
			var cardNum = player.field[j, 0],
			card = player.fieldCard[j];
			
			if(!instance_exists(card)){continue;}
			
			var cardStat = card.getStat;
			
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
			filteredCards[filteredCardCount++] = [player, j]
		}
	}
	
	for (var i = 0; i < filteredCardCount; i++){
		with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
			self.player = filteredCards[i,0]
			position = filteredCards[i,1];
			self.arrayPos = arrayPos
			current_function = TargetMonster
			self.cardNum = self.player.field[position, 0];
			self.artNum = self.player.field[position, 1];
			x = self.player.field_card_zone_x[position];
			y = self.player.field_card_zone_y[position];
		}		
	}
	if(!filteredCardCount){
		if(obj_player.own_turn){
			resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
			return false;
		}
		scr_message_handle_fail()
		return false;
	}
	return true;
}