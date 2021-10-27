function scr_on_attack(attacker, attacked) {
	var cardNum = attacker.cardNum,
	position = attacker.position,
	player = attacker.player;


	if(attacker.getStatus(StatusSilenced)){return;}
	switch(cardNum){
		case 13://Motorbiker Leader Toku Activation Trigger
		case 72://Torch Carrier Activation Trigger
			if(!scr_legal_activation(cardNum, 0, player, attacker.position)){break;}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
		break;
	
	
		case 70://Vengeful Cyborg Activation Trigger
			if(!scr_legal_activation(cardNum, 1, player, attacker.position)){break;}
			scr_add_to_resolution_pile(cardNum, 1, 0, player, position, false)
		break;
	}
}
