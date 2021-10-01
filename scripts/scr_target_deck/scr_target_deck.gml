// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_deck(filterNum, arrayPos){
	/*
	Max Level
	Min Level
	Archetype Array
	Spirit Array
	Check Summonable
	filterNum
	arrayPos
	*/
	var j = 0,
	filtered_cards;
	with(obj_player){
		for (var i = 0; i < deckCount; i++){
			if(scr_check_filter(deck[i,0],filterNum)){
				filtered_cards[j++] = i
			}
		}
	}
	filtered_card_count = j;	
	for (i = 0; i < filtered_card_count; i++){
		legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
		with(legal_targets[i]){
			position = filtered_cards[i];
			self.arrayPos = arrayPos
			cardNum = obj_player.deck[position,0];
			artNum = obj_player.deck[position,1];
			current_function = "deck";
		}
	}
	if(filtered_card_count == 0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}