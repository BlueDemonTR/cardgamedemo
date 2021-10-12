function scr_on_sacrificed(cardNum, manaGain){

	switch(obj_player.selected_wheel){
		case 4://Sacrifice Wheel Gain Activation Trigger
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){return false}
			scr_add_to_resolution_pile(["WheelGain", 0, 0, obj_player.selected_wheel, false, manaGain])
		break;
	}
	switch(cardNum){
		case 75://wealthy sacrifice
		case 76://ruthless sacrifice
		case 77://Cursed Sacrifice
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
		break;
	}


}
