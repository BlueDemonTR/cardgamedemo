function scr_on_mana_summon(cardNum) {
	
	switch(obj_player.selected_wheel){
		case 2://Visclades Wheel Gain Activation Trigger
			if(!scr_check_archetype(cardNum, ArcVisclades)){return false}
			if(!scr_legal_activation("WheelGain", 0, player, obj_player.selected_wheel)){return false}
			scr_add_to_resolution_pile("WheelGain", 0, 0, player, obj_player.selected_wheel, false, getStat(StatLevel))
		break;
	}
	
	switch(cardNum){
		case 2://Motorbiker Doppelganger Activation Trigger
		case 21://Luvies Ing Field Effect Activation Trigger
		case 81://Nightmare Beast Crystal Echo Activation Trigger
		case 82://Nightmare Beast Conductrons Activation Trigger
			if(!scr_legal_activation(cardNum, 0, player, position)){break;}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
		break;
	}


}
