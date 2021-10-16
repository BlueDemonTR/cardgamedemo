function scr_after_attack(cardNumber, attacker, damage) {//TODO Fix
	var cardNum = attacker.cardNum,
	position = attacker.position;
	if(scr_check_archetype(cardNum, ArcMotorbiker) && macros.card_type[cardNum] != TypeMomentum){
		for (var i = 0; i < 5; i++){
			if (player.field[i, 0] == 15){//Motorbiker Leader Ceasar Activation
				if(!scr_legal_activation(cardNum, 0, i)){continue;}
				scr_add_to_resolution_pile([cardNum, 0, 0, i, false])
			}
		}	
	}
	if(!instance_exists(attacker)){return false}
	switch(cardNum){
		case 1://Motorbiker Showman Effect Activation
		case 23://Visclades Gloria Effect Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position])
		break;
	}


}
