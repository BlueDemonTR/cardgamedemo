function scr_silence(player, position) {
	//Silences a card, meaning the card's stat's are reverted and it loses it's statuses and effects
	if(!(player.field[position, 0])){return;}
	
	var affectedCard = player.fieldCard[position];
	
	if(affectedCard.getStatus(StatusRebellious)){return;}
	
	scr_set_status_card(player, position, StatusSilenced, true)
	
	scr_set_stat_card(player, position, StatMaxHP, scr_get_stat_orig(affectedCard.cardNum, StatMaxHP))
	scr_set_stat_card(player, position, StatATK, scr_get_stat_orig(affectedCard.cardNum, StatATK))
	scr_set_stat_card(player, position, StatLevel, scr_get_stat_orig(affectedCard.cardNum, StatLevel))
	
	scr_set_stat_card(player, position, StatArmor, 0)
	scr_set_stat_card(player, position, StatRegeneration, 0)
	scr_set_stat_card(player, position, StatDodge, 0)

	for(var i = 0; i < macros.status_count; i++){
		if(i == StatusSilenced){continue;}
		scr_set_status_card(player, position, i, macros.defaultStatus[i])
	}
}
