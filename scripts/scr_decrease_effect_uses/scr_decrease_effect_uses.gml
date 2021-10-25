function scr_decrease_effect_uses(player, position){
	if(!instance_exists(player.fieldCard[position])){return}
	
	player.fieldCard[position].effectUsesLeft--
}