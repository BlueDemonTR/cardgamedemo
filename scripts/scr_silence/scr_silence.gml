function scr_silence(player, position) {
	var affectedCard = player.fieldCard[position];
	if(affectedCard.cardStatus[StatusRebellious]){return;}
	with (affectedCard){
		cardStat[StatMaxHP] = macros.origStat[cardNum, StatMaxHP];
		cardStat[StatATK] = macros.origStat[cardNum, StatATK];
		cardStat[StatLevel] = macros.origStat[cardNum,StatLevel];

		cardStat[StatArmor] = 0
		cardStat[StatRegeneration] = 0
		cardStat[StatDodge] = 0

		for(var i = 0; i < macros.status_count; i++){
			cardStatus[i] = false;
		}
		cardStatus[StatusSilenced] = true		
	}
	if(player == obj_player){
		scr_message_field_card_stats(position);
	}else if(player == obj_opponent){
		scr_message_opponent_field_card_stats(position);
	}


}
