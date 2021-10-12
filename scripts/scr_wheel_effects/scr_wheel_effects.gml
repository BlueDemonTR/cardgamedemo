function scr_wheel_effects(wheelNum, wheelEffect) {
	switch(wheelNum){
		case 1://Motobiker Wheel Activation Trigger
			switch(wheelEffect){
				case 0:
				case 2:
				case 3:
					if(!scr_legal_activation("WheelEffect", wheelEffect, wheelNum)){break;}
					scr_add_to_resolution_pile(["WheelEffect", wheelEffect, -1, wheelNum, false]);
				break;
				case 1:
					//TODO: scr_impact_summon()
				break;			
			}
		break;
		case 2://Visclades Wheel Activation Trigger
		case 3://Pole Clan Wheel Activation Trigger
		case 4://Sacrifice Wheel Activation Trigger
		case 5://Fisherman Wheel Activation Trigger
		case 6://Classic Wheel Activation Trigger
		case 7://X-Makine Wheel Activation Trigger
			switch(wheelEffect){
				case 0:
				case 1:
				case 3:
					if(!scr_legal_activation("WheelEffect", wheelEffect, wheelNum)){break;}
					scr_add_to_resolution_pile(["WheelEffect", wheelEffect, -1, wheelNum, false]);
				break;
				case 2:
					//TODO: scr_impact_summon()
				break;
			}
		break;
	}
}
