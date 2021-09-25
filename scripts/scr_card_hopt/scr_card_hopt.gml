function scr_card_hopt(argument0) {
	var cardNum = argument0,
	with(obj_player){
		for (i=0; i < hoptCount; i++){
			if (cardNum == hardOncePerTurn[i]){
				return false
			}
		}
	}
	return true;


}
