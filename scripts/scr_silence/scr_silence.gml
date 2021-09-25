function scr_silence(player, position) {
	var affectedCard = player.fieldCard[position];
	if(affectedCard.cardStatus[2]){return;}
	with (affectedCard){
		cardStat[2] = macros.origStat[cardNum,2];
		cardStat[1] = macros.origStat[cardNum,1];
		cardStat[0] = macros.origStat[cardNum,0];

		cardStat[4] = 0
		cardStat[5] = 0
		cardStat[6] = 0

		for(var i = 0; i < macros.status_count; i++){
			cardStatus[i] = false;
		}
		cardStatus[11] = true		
	}
	if(player == obj_player){
		scr_message_field_card_stats(position);
	}else if(player == obj_opponent){
		scr_message_opponent_field_card_stats(position);
	}


}
