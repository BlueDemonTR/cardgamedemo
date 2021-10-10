function scr_on_mana_summon(cardNum) {
	if (scr_check_archetype(cardNum, ArcVisclades) && obj_player.selected_wheel == 2 && !obj_player.wheel_locked){
		if(scr_legal_activation("WheelGain", 2, "Wheel")){
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = "Wheel"
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPile[obj_player.resolutionPileCount,5] = cardStat[StatLevel]
			obj_player.resolutionPileCount++
		}
	}
	if(cardStatus[StatusSilenced]){return;}
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
