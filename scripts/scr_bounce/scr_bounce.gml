function scr_bounce(player, position) {
	var cardNum = player.field[position,0],
	artNum = player.field[position,1];
	
	if(macros.card_type[cardNum] != TypeMomentum && handCount == handSizeLimit){
		scr_add_to_hand(player, cardNum, artNum)
		if(player == obj_opponent){scr_message_opponent_field(position, 0, 0, "bounce")}
		with(player.fieldCard[position]){
			instance_destroy()
		}
	}else{
		scr_spin(player, position)
	}
	
}
