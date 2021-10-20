function scr_ignition_effect_number(cardNum, effectActivationLocation){
	switch(effectActivationLocation){
		case "Field":
			switch(cardNum){
				case 14://Cleo Motorbiker Leader Ignition Effect Number
				case 29://Visclades of Bargaining Ignition Effect Number
				case 35://Pole Clan Mage Ignition Effect Number
				case 47://Igloo Castle Ignition Effect Number
				case 49://Igloo Kingdom Ignition Effect Number
				case 60://The Great Leader Ignition Effect Number
				case 62://Awoken Civillian Ignition Effect Number
				case 83://Fisherman Rookie Ignition Effect Number
				case 85://Wise Fisherman Ignition Effect Number
				case 87://Lucky Fisherman Ignition Effect Number
				case 88://Strong Fisherman Ignition Effect Number
				case 89://Naive Fisherman Ignition Effect Number
				case 90://Fisherman of the Oceans Ignition Effect Number
				case 107://Casey XMakine Ignition Effect Number
				case 108://Theo XMakine Ignition Effect Number
				case 109://Lily XMakine Ignition Effect Number
				case 110://Robert XMakine Ignition Effect Number
				case 111://Dom XMakine Ignition Effect Number
				case 112://Jason DXMakine Ignition Effect Number
					return 0
				break;
			}
		break;
		case "Infirmary":
			switch(cardNum){
				case 21://Luvies Ing HP Increase Ignition Effect Trigger
					return 1
				break;
				case 73://Baby Phoenix Ignition Effect Trigger
					return 0
				break;
			}
		break;
	}
	return -1
}