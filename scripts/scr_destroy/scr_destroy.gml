function scr_destroy(player, position, destroyType) {
	//destroyType is either 0 (Injuries) or 1 (Effect)
	var 
	cardNum =player.fieldCard[position].cardNum,
	artNum =player.fieldCard[position].artNum;

	if(player.fieldCard[position].cardStat[3] > 0 && player.fieldCard[position].cardStatus[4]){
		return;
	}
	with(player.fieldCard[position]){
			animationType = "destroy"
			instance_destroy();
		}

	if(player == obj_player){
		obj_player.infirmary[obj_player.infirmaryCount,0] = cardNum;
		obj_player.infirmary[obj_player.infirmaryCount,1] = artNum;
		obj_player.infirmary[obj_player.infirmaryCount++,2] = destroyType;
		scr_message_infirmary();
	}else{
		obj_opponent.infirmary[obj_opponent.infirmaryCount,0] = cardNum;
		obj_opponent.infirmary[obj_opponent.infirmaryCount,1] = artNum;
		obj_opponent.infirmary[obj_opponent.infirmaryCount++,2] = destroyType;
		scr_message_opponent_field(position,0,0,"destroy")
		scr_message_opponent_infirmary();
	}
	scr_on_destroyed(cardNum);
	return;


}
