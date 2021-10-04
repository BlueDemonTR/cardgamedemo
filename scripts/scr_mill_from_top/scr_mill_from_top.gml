function scr_mill_from_top(player, millCount){
	if(player.deckCount < millCount){return;}
	
	with(player){
		for (var i = 0; i < millCount; i++){
			var cardNum = deck[deckCount-1,0];
			var artNum = deck[deckCount-1,1];
			deck[deckCount-1,0] = 0;
			deck[deckCount-1,1] = 0;
			deckCount--;
			with(instance_create_depth(deck_x,deck_y,-1,card_animations)){
				angle=0
				targetX = player.infirmary_x
				targetY = player.infirmary_y
				activation_mode = "fieldToPlayerInfirmary"
				self.cardNum =cardNum;
				self.artNum =artNum;
			}
			scr_card_sent_to_infirmary(cardNum);
			infirmary[infirmaryCount++] = [cardNum, artNum];
		}
	}
	scr_decide_deck_change(player);
	scr_decide_infirmary(player);


}
