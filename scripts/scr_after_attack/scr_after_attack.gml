function scr_after_attack(argument0) {
	var cardNum = argument0;

	if(scr_check_archetype(cardNum, ArcMotorbiker) && macros.card_type[cardNum] != TypeMomentum){
		for (var i = 0; i < 5; i++){
			if (player.field[i,0] == 15){//Motorbiker Leader Ceasar Activation
				if(scr_legal_activation(cardNum, 0, position)){
					obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
					obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
					obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
					obj_player.resolutionPile[obj_player.resolutionPileCount,3] = i
					obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
					obj_player.resolutionPileCount++					
				}
			}
		}	
	}
	switch(cardNum){
		case 1://Motorbiker Showman Effect Activation
		case 23://Visclades Gloria Effect Activation
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
