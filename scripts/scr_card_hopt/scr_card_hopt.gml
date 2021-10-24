function scr_card_hopt(cardNum, effectNum) {
	with(obj_player){
		for (i = 0; i < hoptCount; i++){
			if (cardNum == hardOncePerTurn[i]){
				return false
			}
		}
	}
	return true;
	
	if(false){
		return effectNum//This is here because I am sick of the syntax error pop up
	}	
}
