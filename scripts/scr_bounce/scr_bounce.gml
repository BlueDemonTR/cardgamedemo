function scr_bounce(argument0) {
	var field_location = argument0,
	player = self.player;
	with(player){
		if(fieldCard[field_location].cardStatus[3]){return;}
		if(macros.card_type[field[field_location,0]] !=1){
			hand[handCount,0] = field[field_location,0];
			hand[handCount,1] = field[field_location,1];
			if(player= obj_player){
				if(handCount < handSizeLimit){
					handCard[handCount] = instance_create_depth(player.fieldCard[field_location].x,player.fieldCard[field_location].y , -handCount-2, obj_card);
					with(handCard[handCount]){
						card_in_hand = true;
						hand_position = player.handCount;
						cardNum = player.hand[hand_position,0];
						artNum = player.hand[hand_position,1];
					}
					handCount++;
					scr_message_hand_change();
				}else{
					scr_spin(field_location)
					return;
				}
			}else if(player = obj_opponent){
				if(handCount < handSizeLimit){
					hand[handCount++,0] = field[field_location,0]
					hand[handCount++,1] = field[field_location,1]
					scr_message_opponent_hand_change();
				}else{
					scr_spin(field_location)
					return;
				}
			}
		

		}else{
			momentum_deck[momentumDeckCount++,0] = field[field_location,0]
			momentum_deck[momentumDeckCount++,1] = field[field_location,1]
			scr_message_momentum_deck();
			scr_message_opponent_momentum_deck();
			
		
		}
		if(player = obj_opponent){scr_message_opponent_field(field_location,0,0,"bounce")}
		scr_message_last_action(macros.name[field[field_location,0]] + " gets sent to the hand");
		scr_last_action(macros.name[field[field_location,0]]+" gets sent to the hand");
		with(fieldCard[field_location]){
			instance_destroy();
		}
	}



}
