function scr_sacrifice(player, position) {
	
	if(player.field[position]){return;}
	
	var affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum;
	
	scr_give_player_stats(player, 0, 0, affectedCard, 0);
	scr_send_infirmary(player, [cardNum, artNum], SendSacrifice);
	scr_on_sacrificed(cardNum);
	
	with(affectedCard){
		instance_destroy();
	}
	scr_message_field(position, 0, 0, "Sacrifice");
}
