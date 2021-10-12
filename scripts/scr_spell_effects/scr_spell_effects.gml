function scr_spell_effects(cardNum) {
	switch(cardNum){
		case 8://Rev Up The Engines Activation Trigger
		case 9://Leader Takeover Activation Trigger
		case 10://The Hunt is on Boys! Activation Trigger
		case 24://Cries of the Underworld Activation Trigger
		case 25://Second Coming Activation Trigger
		case 26://Bloody Sacrifice Activation Trigger
		case 41://Recruitment Activation Trigger
		case 42://Hibernation Activation Trigger
		case 43://Lockdown Activation Trigger
		case 44://Frost Beam Activation Trigger
		case 51://At long last Activation Trigger
		case 52://Centrifugal Reborn Activation Trigger
		case 53: //Healing Lullaby Activation Trigger
		case 56://Earthquake Activation Trigger
		case 57://Power Discharge Activation Trigger
		case 66://Bloodthirst Activation Trigger
		case 78://Genesis Notebook Activation Trigger
		case 79://Gathering of the Accursed Activation Trigger
		case 80://Silent Courage Activation Trigger
		case 91://Lucky Reel Activation Trigger
		case 92://Cursed Reel Activation Trigger
		case 93://Marketplace of Seas Activation Trigger
		case 94://Highest Bidder Activation Trigger
		case 100://Desperate Power Measures Activation Trigger
		case 113://Emergency Call Activation Trigger
		case 114://Mighty Changing Fire Blades Activation Trigger
		case 115://X-Makines Form Together! Activation Trigger
			if(!scr_legal_activation(cardNum, 0, hand_position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, hand_position, false])
		break;
	}
}
