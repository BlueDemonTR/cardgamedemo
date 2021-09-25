function scr_on_pierce(argument0) {
	var cardNum = argument0;
	switch(cardNum){
		case 6: //Violent Wheeler Activation
		case 17: //Visclades Lentus Vio Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++		
		break;
	}


}
