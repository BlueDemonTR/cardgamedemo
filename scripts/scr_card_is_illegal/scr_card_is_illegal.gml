function scr_card_is_illegal(argument0) {
	var cardNum = argument0
	for (var i = 0; i < macros.illegal_card_count; i++){
		if (cardNum = macros.illegal_card[i]){return true;}
	}
	return false;


}
