function scr_on_pierce(attacker, attacked, damage) {
	var cardNum = attacker.cardNum;
	switch(cardNum){
		case 6: //Violent Wheeler Activation
		case 17: //Visclades Lentus Vio Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
		break;
	}


}
