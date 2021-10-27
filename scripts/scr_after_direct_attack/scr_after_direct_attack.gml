function scr_after_direct_attack(attacker, damage) {
	var cardNum = attacker.cardNum,
	player = attacker.player;
	
	switch(obj_player.selected_wheel){
		case 1://Motorbiker Wheel Gain Activation Trigger
			if(!scr_check_archetype(cardNum, ArcMotorbiker)){break;}
			if(!scr_legal_activation("WheelGain", 0, player, player.selected_wheel)){break;}
			scr_add_to_resolution_pile("WheelGain", 0, 0, player, player.selected_wheel, false, damage)
		break;
	}
	
	switch(cardNum){
		case 11: //Motorbiker Leader Khan Effect Activation
		case 12: //Motorbiker Leaden Luther Effect Activation
			if(!scr_legal_activation(cardNum, 0, player, position)){break;}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
		break;
	}


}
