function scr_after_direct_attack(cardNum) {
	
	switch(obj_player.selected_wheel){
		case 1://Motorbiker Wheel Gain Activation Trigger
			if(!scr_check_archetype(cardNum, ArcMotorbiker)){return false}
			if(!scr_legal_activation("WheelGain", 0, selected_wheel)){return false}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "WheelGain"
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = selected_wheel
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	}
	
	switch(cardNum){
		case 11: //Motorbiker Leader Khan Effect Activation
		case 12: //Motorbiker Leaden Luther Effect Activation
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
