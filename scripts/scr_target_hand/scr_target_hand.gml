// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_hand(activator, players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, ignoreTarget, filterNum, arrayPos){
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
	if(activator == obj_opponent){
		scr_message_ask_response(RESPONSE_TARGET_HAND, players, typeArray, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, ignoreTarget, filterNum, arrayPos)
		return;
	}

	var filteredCards,
	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.handCount; j++){
			var cardNum = player.hand[j, 0],
			cardStat = scr_get_stat_orig;

			if(array_length(typeArray) && !array_includes(typeArray, macros.card_type[cardNum])){
				continue;
			}
			if(macros.card_type[cardNum] != TypeSpell && (cardStat(cardNum, StatLevel) > maxLevel || cardStat(cardNum, StatLevel) < minLevel)){
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
			filteredCards[filteredCardCount++] = [player, j]
		}
	}

	for (var i = 0; i < filteredCardCount; i++){
		with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
			self.player = filteredCards[i,0]
			position = filteredCards[i,1];
			self.arrayPos = arrayPos
			self.cardNum = self.player.deck[position, 0];
			self.artNum = self.player.deck[position, 1];
			current_function = TargetDiscard;
			x = self.player.handCard[position].x
			y = self.player.handCard[position].y
		}
		
	}

	if(filteredCardCount == 0){
		if(obj_player.own_turn){
			resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
			return;
		}
		scr_message_handle_fail()
	}
}