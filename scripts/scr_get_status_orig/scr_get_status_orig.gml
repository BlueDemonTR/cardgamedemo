function scr_get_status_orig(cardNum, status){
	if(macros.total_cards < cardNum){
		return;
	}
	if(variable_array_exists(macros.origStatus, cardNum, status)){
		return macros.origStatus[cardNum, status]
	}else{
		return macros.defaultStatus[status]
	}
}