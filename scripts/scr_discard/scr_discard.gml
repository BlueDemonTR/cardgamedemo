function scr_discard(player, position) {
	if(!player.hand[position]){
		return false;
	}
	
	var cardNum = player.hand[position,0],
	artNum = player.hand[position,1],
	removedCard = player.handCard[position];

	scr_remove_from_hand(player, position);

	with(instance_create_depth(x,y,-1,card_animations)){
		angle=0
		targetX = player.infirmary_x
		targetY = player.infirmary_y
		activation_mode = "fieldToPlayerInfirmary"
		self.cardNum =cardNum;
		self.artNum =artNum;
	}
	
	scr_card_sent_to_infirmary(cardNum);
	player.infirmary[player.infirmaryCount,0] = cardNum;
	player.infirmary[player.infirmaryCount++,1] = artNum;
	scr_decide_infirmary(player)
	
	with(removedCard){
		instance_destroy();
	}
}
