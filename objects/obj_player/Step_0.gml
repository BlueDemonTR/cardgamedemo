if(victory_state != 0 && alarm[6] == -1){
	alarm[6] = 180
}
if(!instance_exists(obj_opponent)){return;}
//if(initialization_done){return;}

if(start_turn && turn_count==0){
	if(!(turn_count <= 2)){playerHP=playerMaxHP;}
	scr_message_stats();	
	if (alarm[0] == -1){alarm[0]=1;}
	turn_count++
}
if(start_turn && own_turn){
	mana = 4;
	scr_message_stats();
	alarm[4]=1

}
if(!own_turn|| !open_game_state || obj_action_list.open_list){
	mid_effect = true;
}
else{mid_effect = false;}

if(resolutionPileCount > 0 && open_game_state  && !opponent_response_left && !player_response_left){
	if(resolutionPile[resolutionPileCount-1,2] != 99){
		if(resolutionPile[resolutionPileCount-1,2] = 0){
			resolutionPile[resolutionPileCount-1,2] = 1
			open_game_state = false;
		}
		scr_resolve_effect_in_pile(resolutionPileCount-1)
	}else{
		open_game_state = true
		resolutionPileCount--
	}
}

for(i = 0; i < handCount; i++){
	if(hand[i,0] > 0 && handCard[i] == noone){
		handCard[i] = instance_create_depth(room_width/2,room_height/2,1,obj_card);
		var 
		cardNum = hand[i],
		position = i;
		with(handCard[i]){
			self.cardNum = cardNum;
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
for(i = 0; i < obj_player.field_zone_count; i++){
	if(field[i,0] > 0 && fieldCard[i] == noone){
		scr_message_field(i, field[i,0], field[i,1], "none");
		fieldCard[i] = instance_create_depth(field_card_zone_x[i],field_card_zone_y[i],1,obj_field_card);
		var 
		cardNum = field[i,0],
		artNum = field[i,1],
		sprite = macros.sprite_array[cardNum],
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

	if(playerHP<=0 && victory_state==0){
		playerHP=0;
		scr_message_stats();
		scr_message_game_lose();
		}
	if(playerHP>playerMaxHP){
		playerHP = playerMaxHP;
		scr_message_stats();
	}
	if(momentum>maxmomentum){
		momentum = maxmomentum;
		scr_message_stats();
	}
	if(mana>maxmana){
		mana = maxmana;
		scr_message_stats();
	}


for(i = 0; i < 5; i++){
	if(field[i,0] == 0 && fieldCard[i] != noone){
		with(fieldCard[i]){
			instance_destroy();
		}
	}
}

if(end_phase && alarm[2] == -1){alarm[2]=10};
