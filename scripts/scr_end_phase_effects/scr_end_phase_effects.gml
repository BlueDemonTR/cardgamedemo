function scr_end_phase_effects(){//TODO Complete Rewamp
	switch(obj_player.selected_wheel){
		case 7://XMakine Wheel Gain Activation Trigger
			if(!scr_legal_activation("WheelGain", 0, obj_player.selected_wheel)){return false}
			scr_add_to_resolution_pile(["WheelGain", 0, 0, obj_player.selected_wheel, false])	
		break;
	}
	for(var position = 0; position < player.field_zone_count ; position++){
		if(!field[position, 0]){continue;}

		var affectedCard = fieldCard[position],
		cardNum = field[position, 0];
		
		scr_change_card_status(player, position, StatusParalyzed, false); //Unparalyze Card
		affectedCard.sacrificable = true;//Make card Sacrificable
		affectedCard.effectUsesLeft = macros.origStat[cardNum, StatXPerTurn]
		
		if(affectedCard.cardStatus[StatusSelfDestruct]){//Status Self Destruct Activation Trigger
			if(!scr_legal_activation("SelfDestruct", 0, position)){return false;}			
			scr_add_to_resolution_pile(["SelfDestruct", 0, 0, position, false])
		}
		if(affectedCard.cardStatus[StatusPoison]){//Status Poison Activation Trigger
			if(!scr_legal_activation("Poison", 0, position)){return false;}			
			scr_add_to_resolution_pile(["Poison", 0, 0, position, false])
		}
		if(affectedCard.cardStatus[StatRegeneration]){//Stat Regeneration Activation Trigger
			if(!scr_legal_activation("Regeneration", 0, position)){return false;}
			scr_add_to_resolution_pile(["Regeneration", 0, 0, position, false])
		}
		if(scr_check_shared(cardNum, SharedXMakine)){//XMakine Shared Effect Activation Trigger
			if(!scr_legal_activation("SharedEffects", SharedXMakine, position)){return false;}			
			scr_add_to_resolution_pile(["SharedEffects", SharedXMakine, 0, position, false])
		}
		switch(cardNum){
			case 16://EoS Tag out effect Activation Trigger
				if(!scr_legal_activation(cardNum, 1, position)){break}		
				scr_add_to_resolution_pile([cardNum, 1, 0, position, false])				
			break;
			
			case 34://Pole Clan Archer Activation Trigger
			case 36://Pole Clan Defender Activation Trigger
			case 38://Pole Clan Torch Activation Trigger
			case 72://Torch Carrier Activation Trigger
				if(!scr_legal_activation(cardNum, 0, position)){break}
				scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
			break;
		}	
	}
}