function scr_on_impact_summon(cardNum) {
	if(getStatus(StatusSilenced)){return;}
	switch(cardNum){
		case 16://EoS Activation
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			scr_add_to_resolution_pile([cardNum, 0, 0, position, false])
		break;
	}


}
