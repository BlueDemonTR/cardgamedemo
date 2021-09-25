function scr_paralyze(argument0) {
	var position = argument0;
	with (player.fieldCard[position]){
		cardis_paralyzed = true;
	}
	if(player == obj_player){
		scr_message_field_card_stats(position);
	}else if(player == obj_opponent){
		scr_message_opponent_field_card_stats(position);
	}


}
