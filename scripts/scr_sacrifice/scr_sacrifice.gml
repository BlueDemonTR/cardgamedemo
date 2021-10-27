function scr_sacrifice(player, position) {
	
	if(!player.field[position, 0]){
		return;
	}
	
	var affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum,
	manaGain = affectedCard.getStat(StatLevel);
	
	scr_remove_from_field(player, position, "destroy")
	
	scr_increase_stat_player(player, PlayerMana, manaGain);
	scr_send_infirmary(player, [cardNum, artNum], SendSacrifice);
	scr_on_sacrificed(cardNum, manaGain);
}
