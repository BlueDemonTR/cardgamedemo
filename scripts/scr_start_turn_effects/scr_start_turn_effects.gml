function scr_start_turn_effects(){
	switch(obj_player.selected_wheel){
		case 6://Classic Wheel Gain Activation Trigger
			if(!scr_legal_activation("WheelGain", 0, player, obj_player.selected_wheel)){return false}
			scr_add_to_resolution_pile("WheelGain", 0, 0, player, obj_player.selected_wheel, false)	
		break;
	}
	for(var position = 0; position < player.field_zone_count ; position++){
		if(!field[position, 0]){continue;}
		
		var affectedCard = fieldCard[position],
		cardNum = field[position, 0];
		
		affectedCard.attacksLeft = 1//Card Can Attack Again

		switch(field[position, 0]){
			case 31://Visclades of Acceptance Indestructable Loss Effect Activation Trigger	
				if(!scr_legal_activation(cardNum, 1, player, position)){break;}		
				scr_add_to_resolution_pile(cardNum, 1, 0, player, position, false)
			break;
			
			case 64://Lunar Tank Activation Trigger
				if(!scr_legal_activation(cardNum, 0, player, position)){break;}
				scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
			break;
		}	
	}
}