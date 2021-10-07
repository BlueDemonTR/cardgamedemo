function scr_bounce(player, position) {
	//Sends a monster on the field to it's controller's hand
	//Syntax:
	//player: either obj_player or obj_opponent, decides which player's card is affected
	//position: any value between 0 and field_zone_count - 1 (generally 4)
	//Rulings: If a card is attempted to be bounced while the player's hand is full it will be spun instead.
	//Momentum cards are always bounced
	
	if(!player.fieldCard[position]){return;}
	
	var cardNum = player.field[position, CardNumber],
	artNum = player.field[position,1];
	
	if(macros.card_type[cardNum] != TypeMomentum && handCount == handSizeLimit){
		scr_add_to_hand(player, [cardNum, artNum])
		scr_decide_field(player, position, 0, 0, "bounce")
		with(player.fieldCard[position]){
			instance_destroy()
		}
	}else{
		scr_spin(player, position)
	}
}
