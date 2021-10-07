function scr_impact_summon(argument0) {
	//TODO redo this entire segment completely lmao
	var momentumCost = argument0;
	mid_effect = true;
	filtered_card_count = 0;
	for (var i = 0; i < momentumDeckCount; i++){
		scr_summoning_requirements(i);
	}
	if (filtered_card_count > 0){
		momentum -= momentumCost;
		scr_message_stats();
		for (var i = 0; i < filtered_card_count; i++){
			legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
			with(legal_targets[i]){
				placeInMomentumDeck = global.filtered_cards[i];
				cardNum = obj_player.momentum_deck[placeInMomentumDeck,0];
				artNum = obj_player.momentum_deck[placeInMomentumDeck,1];
				current_function = "impact";
			}
		}
	}else{
		return;
	}


}
