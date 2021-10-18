//monster cards

if (player.main_phase && player.open_game_state && player.own_turn){
	switch(macros.card_type[cardNum]){
		case TypeMonster:
			var fieldZone = scr_get_field_zone(x, y, player);
			if(fieldZone == -1){break;}
			if(!scr_limited_summon(self.cardNum)){break;}
			if(macros.origStat[self.cardNum,StatLevel] > player.mana){
				break;
			}
			if(scr_summon([cardNum, artNum], player, "mana", "none", fieldZone)){
				scr_give_player_stats(player, 0, 0, -macros.origStat[self.cardNum,StatLevel], 0)
				scr_remove_from_hand(player, position)
			}
		break;
		
		case TypeSpell:
			if(!scr_activation_area_check()){break;}
			
			scr_spell_effects(cardNum);
		break;
	}
}