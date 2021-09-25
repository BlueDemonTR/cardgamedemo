function scr_destroy_target(targetController, targetTypes, targetMinLevel, targetMaxLevel, targetArchetype, activatedCard, ignoreTarget) {
	//player,opponent,all
	//main,momentum,all
	//int64 0-12
	//int64 1-13
	//write "any" if no archetypes

	global.effect_successful = true;
	obj_player.mid_effect =true;
	scr_appropiate_targets(targetController, targetTypes, targetMinLevel, targetMaxLevel, targetArchetype, true,ignoreTarget);

	for (var i=0; i < appropiate_target_count_player; i++){

		target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
		with(target_select[i]){
			player=obj_player;
			field_location = global.appropiate_targets[i, 0];
			current_function = "destroy";
			x = player.field_card_zone_x[field_location];
			y = player.field_card_zone_y[field_location];
			effectBelongsTo = activatedCard;
		
		}

	}
	for (var i=0; i < appropiate_target_count_opponent; i++){
		target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
		with(target_select[i]){
			player=obj_opponent;
			field_location = global.appropiate_targets[i, 1];
			current_function = "destroy";
			x = player.field_card_zone_x[field_location];
			y = player.field_card_zone_y[field_location];
			effectBelongsTo = activatedCard;
		
		}

	}
	if(appropiate_target_count_player+appropiate_target_count_opponent==0){
	global.effect_successful=false;
	obj_player.mid_effect = 0;
	}



}
