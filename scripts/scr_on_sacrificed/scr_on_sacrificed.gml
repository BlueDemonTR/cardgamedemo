function scr_on_sacrificed(cardNum, manaGain){

	switch(obj_player.selected_wheel){
		case 4://Sacrifice Wheel Gain Activation Trigger
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){return false}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "WheelGain"
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = obj_player.selected_wheel
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPile[obj_player.resolutionPileCount,5] = manaGain
			obj_player.resolutionPileCount++		
		break;
	}
	switch(cardNum){
		case 75://wealthy sacrifice
		case 76://ruthless sacrifice
		case 77://Cursed Sacrifice
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
