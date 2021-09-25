function scr_mill_archetype(argument0, argument1, argument2, argument3, argument4) {
	var filter_archetype1 = argument0,
	filter_archetype2 = argument1,
	targetMinLevel = argument2,
	targetMaxLevel = argument3,
	activatedCard = argument4;
	global.effect_successful = true;
	obj_player.mid_effect= true;
	scr_filter_archetype(filter_archetype1,filter_archetype2,targetMinLevel,targetMaxLevel,false);


	for (var i = 0; i < filtered_card_count; i++){
		legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
		with(legal_targets[i]){
			placeInDeck = global.filtered_cards[i];
			cardNum = obj_player.deck[placeInDeck];
			current_function = "mill";
			effectBelongsTo = activatedCard;
		}
	}
	if(filtered_card_count == 0){
	global.effect_successful = false;
	obj_player.mid_effect = false;
	}




}
