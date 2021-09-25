for(i = 0; i < 5; i++){
	if(field[i,0] == 0 && fieldCard[i] != noone){
		with(fieldCard[i]){
			instance_destroy();
		}
	}
	if(field[i,0] > 0 && fieldCard[i] == noone){
		scr_message_field(i, field[i,0], field[i,1], "none");
		fieldCard[i] = instance_create_depth(field_card_zone_x[i],field_card_zone_y[i],1,obj_field_card);
		var 
		cardNum = field[i,0],
		cardNum = field[i,1],
		sprite = macros.sprite_array[i],
		position = i;
		with(fieldCard[i]){
			player = obj_player;
			opponent = obj_opponent;
			self.cardNum = cardNum;
			self.artNum = artNum;
			self.position = position;
			scr_info_to_instance(cardNum);
			summoning_method = "effect"
			field_x = player.field_card_zone_x[self.position];
			field_y = player.field_card_zone_y[self.position];
			sprite_index = sprite;
		}
	
	}
}
for(i = 0; i < handCount; i++){
	if(hand[i,0] > 0 && handCard[i] == noone){
		handCard[i] = instance_create_depth(room_width/2,room_height/2,1,obj_card);
		var 
		cardNum = hand[i,0],
		artNum = hand[i,1],
		position = i;
		with(handCard[i]){
			self.cardNum = cardNum;
			self.artNum = artNum;
			hand_position = position;
			card_in_hand = true;
		}
	}
	if(hand[i,0] = 0 && handCard[i] != noone){
		with(handCard[i]){
			scr_remove_from_hand(hand_position)
			instance_destroy();
		}
	}
}
if(end_phase && endPhaseChainCount > 0){
	if(!endPhaseChains[endPhaseChainCount-1,1] && !mid_effect){
		endPhaseChains[endPhaseChainCount-1,1] = true;
		scr_end_phase_effect(endPhaseChains[endPhaseChainCount-1,0]);
	}
}
