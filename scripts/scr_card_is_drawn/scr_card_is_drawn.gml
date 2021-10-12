function scr_card_is_drawn(drawnCardNum){
	for(var i = 0; i < player.field_zone_count; i++){
		var cardNum = player.field[i, 0],
		position = i;
		switch(cardNum){
			case 20://Satio Ces Activation
				if(!scr_legal_activation(cardNum, 0, position)){break;}
				scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
			break;
		}		
	}
}