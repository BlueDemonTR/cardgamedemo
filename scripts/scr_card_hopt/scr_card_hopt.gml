function scr_card_hopt(cardNum, effectNum) {
	with(obj_player){
		for (i=0; i < hoptCount; i++){
			if (cardNum == hardOncePerTurn[i]){
				return false
			}
		}
	}
	return true;
}
