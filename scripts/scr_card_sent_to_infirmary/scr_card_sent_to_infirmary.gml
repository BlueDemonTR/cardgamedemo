function scr_card_sent_to_infirmary(player, sentCard, sendType) {
	for(var i = 0; i < 5; i++){
		var cardNum = obj_player.field[i, 0];
		switch(cardNum){
			case 55://Garbage Collector Activation Trigger
				if(!scr_legal_activation(cardNum, 0, player, i)){break;}
				if(player != obj_player){break;}
				if(macros.card_type[sentCard] == TypeSpell){break;}
				scr_add_to_resolution_pile(cardNum, 0, 0, player, i, false)
			break;
		}
		var cardNum = obj_opponent.field[i, 0];
		switch(cardNum){
			case 55://Garbage Collector Activation Trigger
				if(!scr_legal_activation(cardNum, 0, player, i)){break;}
				if(player != obj_player){break;}
				if(macros.card_type[sentCard] == TypeSpell){break;}
				scr_add_to_resolution_pile(cardNum, 0, 0, player, i, false)
			break;
		}
	}
}
