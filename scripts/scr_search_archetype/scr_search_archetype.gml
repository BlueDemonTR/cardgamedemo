function scr_search_archetype(filter_archetype1, filter_archetype2, targetMinLevel, targetMaxLevel, activatedCard){
	global.effect_successful = true;
	obj_player.mid_effect= true;
	scr_filter_archetype(filter_archetype1,filter_archetype2,targetMinLevel, targetMaxLevel,false);
	for (var i = 0; i < filtered_card_count; i++){
		legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
		with(legal_targets[i]){
			placeInDeck = global.filtered_cards[i];
			cardNum = obj_player.deck[placeInDeck,0];
			artNum = obj_player.deck[placeInDeck,1];
			current_function = "search";
			effectBelongsTo = activatedCard;
		}
	}
	if(filtered_card_count == 0){
		resolutionPile[positionInOrder,2] = 98
	}


}
