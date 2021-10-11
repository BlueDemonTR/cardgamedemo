function scr_sacrifice(player, position) {
	
	if(player.field[position]){return;}
	
	var affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum,
	manaGain = affectedCard.cardStat[StatLevel];
	
	scr_give_player_stats(player, 0, 0, manaGain, 0);
	scr_send_infirmary(player, [cardNum, artNum], SendSacrifice);
	scr_on_sacrificed(cardNum, manaGain);
	
	with(affectedCard){
		instance_destroy();
	}
	scr_message_field(position, 0, 0, "Sacrifice");
}
