function scr_on_summon(cardNum){
	if(scr_check_shared(cardNum, SharedMotorbikerLeader)){
		if(scr_legal_activation("SharedEffects", SharedMotorbikerLeader, player, position)){
			scr_limit_summoning_card(cardNum)
		}
	}
	if(scr_check_shared(cardNum, SharedIgloo)){
		if(scr_legal_activation("SharedEffects", SharedIgloo, player, position)){
			scr_add_to_resolution_pile("SharedEffects", SharedIgloo, 0, player, position, false)
		}
	}
	
	switch(obj_player.selected_wheel){
		case 5://Fisherman Wheel Gain Activation Trigger
			if(!scr_legal_activation("WheelGain", 0, player, obj_player.selected_wheel)){break;}
			if(!scr_check_archetype(cardNum, ArcFish) || scr_check_archetype(cardNum, ArcFisherman)){break;}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false, player.fieldCard[position].getStat(StatLevel))
		break;
	}
	
	if(scr_check_archetype(cardNum, ArcFish) && !scr_check_archetype(cardNum, ArcFisherman)){
		for(var i = 0; i < 5; i++){
			switch(player.field[i, 0]){
				case 88://Strong Fisherman Stat Gain Activation Trigger
				case 90://Fisherman of the Oceans Stat Gain Activation Trigger
					if(!scr_legal_activation(90, 1, player, i)){continue;}
					scr_add_to_resolution_pile(cardNum, 1, 0, player, position, false)
				break;
			}
		}
	}
	switch(cardNum){
		case 4://Motorbiker V-Rider Activation Trigger
		case 5://Motorbiker D-Rider Activation Trigger
		case 7://Motorbiker Protector Activation Trigger
		case 22://Envious Visclades Tia Invaden	Activation Trigger	
		case 27://Visclades of Rejection Activation Trigger
		case 28://Visclades of Anger Activation Trigger
		case 30://Visclades of Depression Activation Trigger
		case 31://Visclades of Acceptance Activation Trigger
		case 33://Pole Clan Builder Activation Trigger
		case 36://Pole Clan Defender Activation Trigger
		case 37://Pole Clan Beast Activation Trigger
		case 48://Igloo Citadel Activation Trigger
		case 54://Battle Medic Activation Trigger
		case 61://Bodyguard Activation Trigger
		case 63://Rebellion Ally Activation Trigger
		case 68://Machine Gun Soldiers Activation Trigger
		case 69://Speed Soldier Activation Trigger
		case 70://Mad Cyborg Activation Trigger
		case 71://Armed Civillian Activation Trigger
		case 74://Useless Sacrifice Activation Trigger
		case 86://Goldfish Activation Trigger
		case 96://Medical General Activation Trigger
		case 99://Single Shot Master Activation Trigger
		case 101://Rogue Soldier Activation Trigger
			if(!scr_legal_activation(cardNum, 0, player, position)){
				break;
			}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
		break;
	}




}
