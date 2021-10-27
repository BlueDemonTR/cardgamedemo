function scr_on_pierce(attacker, attacked, damage) {
	var cardNum = attacker.cardNum,
	position = attacker.position
	player = attacker.player;
	switch(cardNum){
		case 6: //Violent Wheeler Activation
		case 17: //Visclades Lentus Vio Activation
			if(!scr_legal_activation(cardNum, 0, player, position)){break;}
			scr_add_to_resolution_pile(cardNum, 0, 0, player, position, false)
		break;
	}


}
