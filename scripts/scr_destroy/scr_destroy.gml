function scr_destroy(destroyedCard, destroyType) {
	//destroyType is either 0 (Injuries) or 1 (Effect)
	var 
	cardNum =player.fieldCard[destroyedCard].cardNum,
	artNum =player.fieldCard[destroyedCard].artNum;

	if(player.fieldCard[destroyedCard].cardStat[3] > 0 && player.fieldCard[destroyedCard].cardStatus[4]){
		return;
	}
	with(player.fieldCard[destroyedCard]){
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
		scr_message_opponent_field(destroyedCard,0,0,"destroy")
		scr_message_opponent_infirmary();
	}
	scr_on_destroyed(cardNum);
	return;


}
