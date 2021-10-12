function scr_after_direct_attack(attacker, damage) {
	
	switch(obj_player.selected_wheel){
		case 1://Motorbiker Wheel Gain Activation Trigger
			if(!scr_check_archetype(cardNum, ArcMotorbiker)){break;}
			if(!scr_legal_activation("WheelGain", 0, player.selected_wheel)){break;}
			scr_add_to_resolution_pile(["WheelGain", 0, 0, player.selected_wheel, false, damage])
			obj_player.resolutionPileCount++
		break;
	}
	
	switch(cardNum){
		case 11: //Motorbiker Leader Khan Effect Activation
		case 12: //Motorbiker Leaden Luther Effect Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
		break;
	}


}
