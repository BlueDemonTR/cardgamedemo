function scr_count_attack(attacker){
	//This is a special type of count function as it returns an 
	//array of targets instead of just returning a number
	var attackArray = [],
	tauntExists = false;
	
	tauntExists = bool(scr_count_field_filter([opponent], [], [1, 12], [0, infinity], [0, infinity], [], [], -1, 3));
	
	if(!tauntExists || scr_check_shared(attacker.cardNum, ArcMotorbiker)){
		array_push(attackArray, "player")
	}
	
	for(var i = 0; i < 5; i++){
		if(!opponent.field[i, 0]){continue;}
		if(!opponent.fieldCard[i].cardStatus[StatusSneaky] && (!tauntExists || !opponent.fieldCard[i].cardStatus[StatusTAUNT])){
			array_push(attackArray, i);
		}
	}
	return attackArray
}