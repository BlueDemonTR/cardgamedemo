function scr_impact_summon_materials(argument0, argument1, argument2, argument3) {
	var placeInMomentumDeck = argument0,
	targetTypes= argument1, //main,momentum,all
	targetMinLevel =argument2, //int64 0-12
	targetMaxLevel = argument3; //int64 1-13

	if(momentum_deck[placeInMomentumDeck,0] >10 && momentum_deck[placeInMomentumDeck,0] < 17){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, 1, false,-1);
		show_debug_message("motor")
	}else if(momentum_deck[placeInMomentumDeck,0] >= 27 && momentum_deck[placeInMomentumDeck,0] <= 31){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, 3, false,-1);
		show_debug_message("geno")
	}else if(momentum_deck[placeInMomentumDeck,0] >= 47 && momentum_deck[placeInMomentumDeck,0] <= 49){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, 4, false,-1);
		for (i=0;i<5;i++){
			if(scr_check_archetype(field[i,0], 5)){global.appropiate_targets[appropiate_target_count_player++, 0] = i;}
		}
		show_debug_message("Igloo")
	}else if(momentum_deck[placeInMomentumDeck,0] == 70){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, "any", false,-1);
		show_debug_message("vengeful")
	}else if(momentum_deck[placeInMomentumDeck,0] == 78){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, 7, false,-1);
		show_debug_message("sacrifice")
	}else if(momentum_deck[placeInMomentumDeck,0] == 90){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, 10, false,-1);
		show_debug_message("fish")
	}else if(momentum_deck[placeInMomentumDeck,0] == 112){
		scr_appropiate_targets("player", targetTypes, targetMinLevel, targetMaxLevel, 11, false,-1)
	}

	for (var i=0; i < appropiate_target_count_player; i++){

		target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
		with(target_select[i]){
			player=obj_player;
			field_location = global.appropiate_targets[i, 0];
			current_function = "impact";
			x = player.field_card_zone_x[field_location];
			y = player.field_card_zone_y[field_location];
			cardToSummon = placeInMomentumDeck;
		}

	}


}
