if(current_function = "discard" && instance_exists(obj_player.handCard[field_location])){
	if(field_location >= obj_player.handCount){
		instance_destroy()
	}
	x = obj_player.handCard[field_location].x
	y = obj_player.handCard[field_location].y
	depth = obj_player.handCard[field_location].depth -1

}
if (current_function == "DirectAttack" && sprite_index != spr_select_player_selected){
	sprite_index = spr_select_player_unselected;
	mask_index = spr_select_player_collision;
}
if (current_function == "impact" && obj_appropiate_targets.alarm[0] == -1){
	if(field_location == 4){force_select=true;}
	if(force_select){selected=true;}
	if (selected){sprite_index = spr_select_target_selected}
	if (!selected){sprite_index = spr_select_target_unselected}	
	if(scr_check_materials(obj_player.momentum_deck[cardToSummon,0])){
		with(obj_appropiate_targets){
			if(selected){
				with(obj_player.fieldCard[field_location]){
					var cardNum = self.cardNum;
					animationType="destroy"
					obj_player.infirmary[obj_player.infirmaryCount++] = cardNum;
					scr_message_infirmary()
					instance_destroy();
				}
				selected=false;
			}
			x=-600
		}
		if(obj_player.alarm[3] == -1 && alarm[0] == -1){obj_player.alarm[3] = 1;}
	}
}

