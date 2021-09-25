function scr_discard(position) {
	var cardNum=obj_player.hand[position,0],
	artNum = obj_player.hand[position,1],
	removedCard = obj_player.handCard[position];


	scr_remove_from_hand(position);

	with(instance_create_depth(x,y,-1,card_animations)){
		angle=0
		targetX = obj_player.infirmary_x
		targetY = obj_player.infirmary_y
		activation_mode = "fieldToPlayerInfirmary"
		self.cardNum =cardNum;
		self.artNum =artNum;
	}
	scr_card_sent_to_infirmary(cardNum);
	obj_player.infirmary[obj_player.infirmaryCount,0] = cardNum;
	obj_player.infirmary[obj_player.infirmaryCount++,1] = artNum;
	scr_message_infirmary()
	with(removedCard){
		instance_destroy();
	}
}
