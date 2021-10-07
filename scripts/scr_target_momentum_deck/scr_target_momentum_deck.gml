// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_momentum_deck(players, minLevel, maxLevel, archetypeArray, spiritArray, checkSummonable, filterNum, arrayPos){
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
			var cardNum = player.momentumDeck[i, CardNumber],
			cardStat = macros.origStat[cardNum];
			
			if(macros.card_type[cardNum] != TypeSpell && (cardStat[StatLevel] > maxLevel || cardStat[StatLevel] < minLevel)){
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
			if(!scr_check_filter(cardNum, filterNum)){
				continue;
			}
			filteredCards[filteredCardCount++] = [player, i]
		}
	}
	
	for (i = 0; i < filteredCardCount; i++){
		with(instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets)){
			self.player = filteredCards[i, 0];
			position = filteredCards[i, 1];
			self.arrayPos = arrayPos
			self.cardNum = self.player.momentumDeck[position, CardNumber];
			artNum = self.player.momentumDeck[position,1];
			current_function = "momentumDeck";
		}
	}
	if(filteredCardCount == 0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}