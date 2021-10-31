function scr_after_attack(attacker, damage) {
	var cardNum = attacker.cardNum,
	position = attacker.position,
	player = attacker.player;
	
	if(scr_check_archetype(cardNum, ArcMotorbiker) && macros.card_type[cardNum] != TypeMomentum){
		for (var i = 0; i < 5; i++){
			switch(obj_player.field[i, 0]){
				case 15://Motorbiker Leader Ceasar Activation
					if(!scr_legal_activation(cardNum, 0, player, i)){continue;}
					scr_add_to_resolution_pile(cardNum, 0, 0, player, i, false)
				break;
			}
			switch(obj_opponent.field[i, 0]){
				default:
				break;
			}
		}	
	}
	
	if(!instance_exists(attacker)){return false}
	switch(cardNum){
		case 1://Motorbiker Showman Effect Activation
		case 23://Visclades Gloria Effect Activation
			if(!scr_legal_activation(cardNum, 0, player, position)){break;}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, 0)
		break;
	}
}
