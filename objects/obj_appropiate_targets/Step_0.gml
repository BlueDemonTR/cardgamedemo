if(current_function = "discard" && instance_exists(obj_player.handCard[position])){
	if(position >= obj_player.handCount){
		instance_destroy()
	}
	x = obj_player.handCard[position].x
	y = obj_player.handCard[position].y
	depth = obj_player.handCard[position].depth -1
}
if (current_function == "DirectAttack" && sprite_index != spr_select_player_selected){
	sprite_index = spr_select_player_unselected;
	mask_index = spr_select_player_collision;
}
