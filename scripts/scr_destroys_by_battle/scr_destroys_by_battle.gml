function scr_destroys_by_battle(attacker, destroyedMonster) {
	if(!instance_exists(attacker)){return;}
	if(attacker.cardStatus[StatusSilenced]){return;}
	
	var cardNum = attacker.cardNum,
	position = attacker.position;
	
	switch(cardNum){
		case 18://Riti Ava Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
		break;
	
	
		case 19://Idine Lib Activation
			if(!scr_legal_activation(cardNum, 0, position, destroyedMonster)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false, destroyedMonster])
		break;
	}
}
