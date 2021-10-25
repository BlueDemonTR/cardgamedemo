function scr_silence(player, position) {
	//Silences a card, meaning the card's stat's are reverted and it loses it's statuses and effects
	if(!(player.field[position, 0])){return;}
	
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
		
		scr_set_status_card(player, position, StatusSilenced, true)
	}
	
	scr_decide_field_card_stats(player, position);


}
