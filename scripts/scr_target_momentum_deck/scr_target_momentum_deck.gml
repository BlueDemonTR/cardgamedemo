// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_momentum_deck(activator, players, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, filterNum, arrayPos){
	/*
	players (enter all player objects that are affected in an array)
	Max Level (between 1-12)
	Min Level (between 1-12)
	Archetype Array (Checks if the card is a part of ANY of the archetypes in the array)
	Spirit Array
	Check Summonable
	filterNum
	arrayPos
	*/
	var	filteredCards,
	filteredCardCount = 0;

	for(var i = 0; i < array_length(players); i++){
		var player = players[i]
		
		for(var j = 0; j < player.momentumDeckCount; j++){
			var cardNum = player.momentumDeck[j, 0],
			cardStat = scr_get_stat_orig;
			
			if(cardStat(cardNum, StatLevel) > maxLevel || cardStat(cardNum, StatLevel) < minLevel){
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
			if(!scr_check_filter(cardNum, j,filterNum)){
				continue;
			}
			filteredCards[filteredCardCount++] = [player, j]
		}
	}
	
	for (i = 0; i < filteredCardCount; i++){
		var card_x = room_width/2 - sprite_get_width(spr_base_white)/2 + card_width + (card_width+30)*i, 
		card_y = room_height/2 - sprite_get_height(spr_base_white)/2 + card_height/2 + 20;
		with(instance_create_layer(card_x, card_y, "UpperInstances", obj_legal_targets)){
			self.player = filteredCards[i, 0];
			position = filteredCards[i, 1];
			self.arrayPos = arrayPos
			self.cardNum = self.player.momentumDeck[position, 0];
			artNum = self.player.momentumDeck[position,1];
			current_function = SelectMomentum;
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