function scr_damage_card(controller, position, damage) {
	with (player.fieldCard[position]){
		cardStat[3] -= damage;
	}
	if(player == obj_player){
		scr_message_field_card_stats(position);
	}else if(player == obj_opponent){
		scr_message_opponent_field_card_stats(position);
	}


}
