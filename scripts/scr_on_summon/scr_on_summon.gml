function scr_on_summon(cardNum){
	if(scr_check_shared(cardNum, SharedMotorbikerLeader)){//TODO This is not a triggered effect
		if(scr_legal_activation("SharedEffect", SharedMotorbikerLeader, position)){
		obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
		obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
		obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
		obj_player.resolutionPileCount++
		}
	}
	
	switch(obj_player.selected_wheel){
		case 5://Fisherman Wheel Gain Activation Trigger
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){return false}
			if(!scr_check_archetype(cardNum, ArcFish) || scr_check_archetype(cardNum, ArcFisherman)){return false}
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "WheelGain"
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = obj_player.selected_wheel
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPile[obj_player.resolutionPileCount,5] = macros.origStat(cardNum, StatLevel)
				obj_player.resolutionPileCount++		
		break;
	}
	
	if(scr_check_archetype(cardNum, ArcFish) && !scr_check_archetype(cardNum, ArcFisherman)){
		for(var i = 0; i < 5; i++){
			if(obj_player.field[i, 0] == 90){
				if(!scr_legal_activation(90, 0, i)){continue;}
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++
			}
			if(obj_player.field[i, 0] == 88){
				if(!scr_legal_activation(88, 0, i)){continue;}
				obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
				obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
				obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
				obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
				obj_player.resolutionPileCount++
			}
		}
	}
	switch(cardNum){
		case 4://Motorbiker V-Rider Activation Trigger
		case 5://Motorbiker D-Rider Activation Trigger
		case 7://Motorbiker Protector Activation Trigger
		case 22://Envious Genocider Tia Invaden	Activation Trigger	
		case 27://Genocider of Rejection Activation Trigger
		case 28://Genocider of Anger Activation Trigger
		case 30://Genocider of Depression Activation Trigger
		case 31://Genocider of Acceptance Activation Trigger
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
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	}




}
