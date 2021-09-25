if(current_function == "impact"){
	force_select = false
	obj_player.currentLevel = 0;
	obj_player.leader = false;
	obj_player.motorbikers = 0;
	obj_player.igloo = false;
	obj_player.poleclan = 0;
	obj_player.genocider = 0;
	obj_player.sacrifices = 0
	obj_player.fishes = 0
	obj_player.fisherman = false
	obj_player.x_makines = 0
	obj_player.impactSummoning = true;
	obj_player.cardToSummon = cardToSummon;
	if(obj_player.field[4,0] > 0){
		if(obj_player.momentum_deck[cardToSummon,0] == 16){
			if(scr_check_archetype(obj_player.field[field_location,0],2)){obj_player.leader = true;}
			if(scr_check_archetype(obj_player.field[field_location,0],1)){obj_player.motorbikers++;}
			
		}
		obj_player.currentLevel += obj_player.fieldCard[4].cardStat[0]; 
	}
	if(scr_check_archetype(obj_player.momentum_deck[cardToSummon,0], 5) && scr_check_archetype(obj_player.field[field_location,0], 5)){
		force_select= true;
		obj_player.igloo = true;
		if(field_location != 4){obj_player.currentLevel += obj_player.fieldCard[field_location].cardStat[0]; }
	}
}

