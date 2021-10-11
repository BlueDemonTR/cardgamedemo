//monster cards

if (player.main_phase && !player.mid_effect && player.own_turn){
	for (i = 0; i< 4; i++){
		if (x > player.field_card_zone_x[i] - card_width/2 && x < player.field_card_zone_x[i] + card_width/2){
			if (y > player.field_card_zone_y[i] - card_height/2 && y < player.field_card_zone_y[i] + card_height/2){
				if (scr_limited_summon(self.cardNum) && macros.card_type[self.cardNum] != TypeSpell && player.field[i, 0] == 0 && macros.origStat[self.cardNum,StatLevel] <= player.mana){
		
					player.fieldCard[i] = instance_create_depth(player.field_card_zone_x[i], player.field_card_zone_y[i], 1, obj_field_card);
					var
					sprite = sprite_index,
					cardNum = self.cardNum,
					artNum = self.artNum,
					position = i;
					with(player.fieldCard[i]){
						summoning_method = "mana"
						player = obj_player;
						opponent = obj_opponent;
						self.cardNum = cardNum;
						self.artNum = artNum;
						self.position = position;
						scr_info_to_instance(cardNum);
						field_x = player.field_card_zone_x[self.position];
						field_y = player.field_card_zone_y[self.position];
						sprite_index = sprite;
						player.mana = player.mana - macros.origStat[self.cardNum,0];
						scr_message_stats();
					}
					scr_message_field(position, cardNum, artNum, "none");
					scr_remove_from_hand(player ,hand_position);
					instance_destroy();
					player.field[i, 0]= cardNum;
					player.field[i, 1]= cardNum;
				}
			}
		}
	}

//spell

	var cardNum = self.cardNum;
	if(macros.card_type[cardNum] == TypeSpell){
		if(scr_activation_area_check()){
			scr_spell_effects(cardNum);
		

		}


	}
	
}