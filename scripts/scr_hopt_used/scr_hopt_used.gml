function scr_hopt_used(argument0) {
	var cardNum = argument0;

	with(player){
		hardOncePerTurn[hoptCount++] = cardNum;
	}


}
