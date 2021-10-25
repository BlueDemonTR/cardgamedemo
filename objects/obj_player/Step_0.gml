if(victory_state != 0 && alarm[6] == -1){
	alarm[6] = 180
}
if(!instance_exists(obj_opponent)){return;}
if(!initialization_done){return;} 

if(start_turn && turn_count==0){
	if (alarm[0] == -1){alarm[0] = 1;}
	turn_count++
}
if(start_turn && own_turn && !startTurnEffectsActivated){
	scr_set_stat_player(player, PlayerMana, 4)
	
	scr_draw(player, 1, true);
	
	scr_start_turn_effects()
	
	startTurnEffectsActivated = true
}

if(start_turn && startTurnEffectsActivated && open_game_state){
	start_turn = false
	main_phase = true
	startTurnEffectsActivated = false
}

if(end_phase && !endTurnEffectActivated){
	scr_end_phase_effects()
	scr_reset_limitations()
	endTurnEffectActivated = true
}

if(!own_turn|| !open_game_state || obj_action_list.open_list){
	mid_effect = true;
}
else{mid_effect = false;}

if(resolvingPileCount){
	if(resolvingPile[resolvingPileCount-1,2] != 99){
		if(resolvingPile[resolvingPileCount-1,2] = 0){
			resolvingPile[resolvingPileCount-1,2] = 1
			open_game_state = false;
		}
		scr_resolve_effect_in_pile(resolvingPileCount-1)
	}else{
		open_game_state = true
		resolvingPileCount--
	}	
}else if(resolutionPileCount > 0 && open_game_state){
	if(!opponent_response_left && !player_response_left && !response_delay){
		resolvingPile = resolutionPile;
		resolvingPileCount = resolutionPileCount;
		resolutionPileCount = 0

		//DEBUG
		player_response_left = false
		opponent_response_left = false
		response_delay = 10
	}else{
		response_delay--
	}

}

for(i = 0; i < obj_player.field_zone_count; i++){//TODO, Rewrite
	if(field[i, 0] > 0 && fieldCard[i] == noone){
		scr_message_field(i, field[i, 0], field[i, 1], "none");
		fieldCard[i] = instance_create_depth(field_card_zone_x[i],field_card_zone_y[i],1,obj_field_card);
		var 
		cardNum = field[i, 0],
		artNum = field[i, 1],
		sprite = macros.sprite_array[cardNum],
		position = i;
		with(fieldCard[i]){
			player = obj_player;
			opponent = obj_opponent;
			self.cardNum = cardNum;
			self.artNum = artNum;
			self.position = position;
			scr_info_to_instance(cardNum);
			summoning_method = SummonEffect
			field_x = player.field_card_zone_x[self.position];
			field_y = player.field_card_zone_y[self.position];
			sprite_index = sprite;
		}
	
	}
	
}

if(getStat(PlayerHP) <= 0 && victory_state==0){
	scr_set_stat_player(obj_player, PlayerHP, 0)
	scr_message_game_lose();
}

for(i = 0; i < 5; i++){//TODO: Rewrite
	if(field[i, 0] == 0 && fieldCard[i] != noone){
		with(fieldCard[i]){
			instance_destroy();
		}
	}
}
if(end_phase && alarm[2] == -1){alarm[2]=10};
