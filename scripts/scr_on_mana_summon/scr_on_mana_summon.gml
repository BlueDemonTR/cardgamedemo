function scr_on_mana_summon(cardNum) {
	switch(obj_player.selected_wheel){
		case 2://Visclades Wheel Gain Activation Trigger
			if(!scr_check_archetype(cardNum, ArcVisclades)){return false}
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){return false}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "WheelGain"
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = obj_player.selected_wheel
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPile[obj_player.resolutionPileCount,5] = cardStat[StatLevel]
			obj_player.resolutionPileCount++		
		break;
	}
	switch(cardNum){
		case 2://Motorbiker Doppelganger Activation Trigger
		case 21://Luvies Ing Field Effect Activation Trigger
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
