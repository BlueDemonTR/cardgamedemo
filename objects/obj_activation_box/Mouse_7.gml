var position = self.position,
activation_mode = self.activation_mode;
switch(activation_mode){
	case "Attack":
		scr_attack(player.fieldCard[position]);
		player.open_game_state = false;
	break;
	case "Sacrifice":
		scr_sacrifice(player, position);	
	break;
	case "Effect":
		switch(obj_player.field[position,0]){
			case 14://Motorbiker Leader Cleo Activation Trigger
			case 29://Visclades of Denial Activation Trigger
			case 35://Pole Clan Mage Activation Trigger Activation Trigger
			case 47://Igloo Castle Activation Trigger
			case 49://Igloo Kingdom Activation Trigger
			case 60://The Great Leader Activation Trigger
			case 62://Awoken Civillian Activation Trigger
			case 83://Fisherman Rookie Activation Trigger
			case 85://Wise Fisherman Activation Trigger
			case 87://Lucky Fisherman Activation Trigger
			case 88://Strong Fisherman Activation Trigger
			case 89://Naive Fisherman Activation Trigger
			case 90://Fisherman of the Oceans Activation Trigger
			case 107://Casey XMakine Activation Trigger
			case 108://Theo XMakine Activation Trigger
			case 109://Lily XMakine Activation Trigger
			case 110://Robert XMakine Activation Trigger
			case 111://Dom XMakine Activation Trigger
			case 112://Jason DXMakine Activation Trigger			
				if(!scr_legal_activation(obj_player.field[position,0], 0, position)){return false}
				scr_add_to_resolution_pile([obj_player.field[position,0], 0, 0, position, false])
			break;
		}
	case "Hand Effect":
		if(scr_check_shared(obj_player.hand[position,0], ArcVisclades)){//Visclades Shared Effect Activation Trigger
			if(scr_legal_activation("SharedEffects", ArcVisclades, position)){return false}
			scr_add_to_resolution_pile(["SharedEffects", ArcVisclades, 0, position, false])
		}
	break;
	case "Infirmary Effect":
		switch(obj_player.infirmary[position,0]){
			case 21://Luvies Ing Visclades Healing Activation Trigger
				if(scr_legal_activation(obj_player.infirmary[position,0], 1, position)){return false}
				scr_add_to_resolution_pile([obj_player.infirmary[position,0], 1, 0, position, false])
			break;
			case 73://Baby Phoenix Activation Trigger
				if(scr_legal_activation(obj_player.infirmary[position,0], 0, position)){return false}
				scr_add_to_resolution_pile([obj_player.infirmary[position,0], 0, 0, position, false])
			break;
		}	
	break;
	case "Multiple Choices":
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,arrayPos] = choiceNum;
		obj_player.resolutionPile[obj_player.resolutionPileCount-1,2]++
	break;	
}
with(obj_activation_box){
	if(self.activation_mode == activation_mode || self.position == position){
		instance_destroy();
	}
}