function scr_remove_from_field(player, position, removeType){
	var affectedCard = player.fieldCard[position]
	if(!instance_exists(affectedCard)){
		return false;
	}
	
	player.field[position] = [0, 0]
	instance_destroy(player.fieldCard[position])
	player.fieldCard[position] = noone

	scr_decide_field(player, position, 0, 0, removeType);
	return;
}
