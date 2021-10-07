function scr_if_you_control(cardNum) {
	for (var i=0;i < 5;i++){
		if(obj_player.field[i, CardNumber]==cardNum){return true;}
	}
	return false;
}
