function scr_card_is_drawn(drawnCardNum){
	
	for(var position = 0; position < player.field_zone_count; position++){
		var cardNum = obj_player.field[position, 0];
		switch(cardNum){
			case 20://Satio Ces Activation
				if(!scr_legal_activation(cardNum, 0, obj_player, position)){break;}
				scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
			break;
		}
		var cardNum = obj_opponent.field[position, 0];
		switch(cardNum){
			default:
			break;
		}
	}
	return;
	
	if(false){
		drawnCardNum = "bepis"; //This is here because I am tired of the Syntax error
	}
}