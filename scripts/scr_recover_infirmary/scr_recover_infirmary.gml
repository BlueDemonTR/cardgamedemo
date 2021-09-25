function scr_recover_infirmary(argument0) {
	var infirmaryPos = argument0;
	with(player){	
		var summoned_card = infirmary[infirmaryPos,0];
		var summoned_art = infirmary[infirmaryPos,1];
		scr_message_last_action("Opponent adds"+ macros.name[summoned_card]+" from the Infirmary to their hand");
		scr_last_action("You added "+ macros.name[summoned_card]+" from the Infirmary to their hand");
		scr_remove_from_infirmary(infirmaryPos);
		if(macros.card_type[summoned_card] != 1){
			hand[handCount,0] = summoned_card;
			hand[handCount,1] = summoned_art;
			if(player= obj_player){
				handCard[handCount] = instance_create_depth(player.infirmary_x,infirmary_y , -handCount-2, obj_card);
				with(handCard[handCount]){
		
					card_in_hand = true;
					hand_position = player.handCount;
					cardNum = player.hand[hand_position,0];
					artNum = player.hand[hand_position,1];
				}
			}
			handCount++;
			scr_message_hand_change();
			scr_message_opponent_hand_change();

		}else{
			momentum_deck[momentumDeckCount++,0] = summoned_card;
			momentum_deck[momentumDeckCount++,1] = summoned_art;
			scr_message_momentum_deck();
		}
		
	
	}


}
