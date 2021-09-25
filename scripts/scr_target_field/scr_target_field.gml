function scr_target_field(targetController, targetTypes, targetMinLevel, targetMaxLevel, targetSpirit, targetArchetype, ignoreTarget, arrayPos) {
	//targetController = player,opponent,all
	//targetTypes = main,momentum,all
	//targetMinLevel int64 0-12
	//targetMaxLevel int64 1-13
	//targetArchetype write "any" if no archetypes
	//ignoreTarget ignore a target on the field(maybe itself?)

	scr_appropiate_targets(targetController, targetTypes, targetMinLevel, targetMaxLevel, targetSpirit, targetArchetype, true, ignoreTarget);

	for (var i=0; i < appropiate_target_count_player; i++){

		target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
		with(target_select[i]){
			player=obj_player;
			position = global.appropiate_targets[i, 0];
			self.current_function = "target";
			self.arrayPos = arrayPos
			x = player.field_card_zone_x[field_location];
			y = player.field_card_zone_y[field_location];
		}

	}
	for (var i=0; i < appropiate_target_count_opponent; i++){

		target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
		with(target_select[i]){
			player=obj_opponent;
			position = global.appropiate_targets[i, 1];
			self.current_function = "target";
			self.arrayPos = arrayPos
			x = player.field_card_zone_x[field_location];
			y = player.field_card_zone_y[field_location];
		}

	}
	if(appropiate_target_count_player+appropiate_target_count_opponent==0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}



}