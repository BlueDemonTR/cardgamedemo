function scr_card_sent_to_infirmary(cardNum, sendType) {
	for(var i = 0; i < 5; i++){
		switch(obj_player.field[i, 0]){
			case 55://Garbage Collector Activation Trigger
				if(!scr_legal_activation(cardNum, 0, position)){break;}
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = i
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++
			break;
		}
	}
}
