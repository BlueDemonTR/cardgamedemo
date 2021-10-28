//monster cards

if (player.main_phase && player.open_game_state && player.own_turn){
	switch(macros.card_type[cardNum]){
		case TypeMonster:
			var fieldZone = scr_get_field_zone(x, y, player);
			if(fieldZone == -1){break;}
			if(!scr_limited_summon(self.cardNum)){break;}
			if(macros.origStat[self.cardNum,StatLevel] > player.getStat(PlayerMana)){
				break;
			}
			if(scr_summon([cardNum, artNum], player, SummonMana, 0, fieldZone)){
				scr_increase_stat_player(player, PlayerMana, -macros.origStat[self.cardNum,StatLevel])
				scr_remove_from_hand(player, position)
			}
		break;
		
		case TypeSpell:
			if(!scr_activation_area_check()){break;}
			
			scr_spell_effects(cardNum);
		break;
	}
}