function scr_recover_infirmary_archetype(argument0,argument1,argument2,argument3,argument4) {
	var
	targetTypes = argument0,//main,momentum,all
	targetMinLevel =argument1, //int64 0-12
	targetMaxLevel = argument2, //int64 1-13
	targetArchetype = argument3, //write any if no archetypes
	activatedCard = argument4;
	global.effect_successful=true;
	obj_player.mid_effect = true;
	scr_filter_archetype_infirmary(targetArchetype,targetTypes,targetMinLevel,targetMaxLevel,false);
	for (var i = 0; i < filtered_card_count; i++){

		legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
		with(legal_targets[i]){
			infirmaryPos = global.filtered_cards[i];
			cardNum = obj_player.infirmary[infirmaryPos];
			current_function = "recover";
			effectBelongsTo = activatedCard;
		}
	}

	if(filtered_card_count == 0){
		obj_player.mid_effect = false;
		global.effect_successful = false;
	}


}
