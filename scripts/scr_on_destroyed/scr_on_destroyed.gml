function scr_on_destroyed(cardNum, position, destroyType){
	if(scr_check_shared(cardNum, SharedUnderworldVisclades)){
		if(scr_legal_activation("SharedEffect", 0, SharedUnderworldVisclades)){
			scr_add_to_resolution_pile(["SharedEffects", 0, 0, SharedUnderworldVisclades, false])
		}
	}
	if(scr_check_shared(cardNum, SharedSacrifice)){
		if(scr_legal_activation("SharedEffect", 0, SharedSacrifice)){
			scr_add_to_resolution_pile(["SharedEffects", 0, 0, SharedSacrifice, false])
		}
	}
	switch(cardNum){
		case 3://Motorbiker Wildrider Activation Trigger
		case 58://Man With a Shield Activation Trigger
		case 61://Body Guard Activation Trigger
		case 63://Rebellion Ally Activation Trigger
		case 67://Pan Soldier Activation Trigger
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
		break;
	}
}
