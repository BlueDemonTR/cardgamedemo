function scr_card_sent_to_infirmary(cardNum, sendType) {
	for(var i = 0; i < 5; i++){
		switch(obj_player.field[i, 0]){
			case 55://Garbage Collector Activation Trigger
				if(!scr_legal_activation(cardNum, 0, i)){break;}
				scr_add_to_resolution_pile([cardNum, 0, 0, i, false])
			break;
		}
	}
}
