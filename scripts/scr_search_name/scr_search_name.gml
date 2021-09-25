function scr_search_name(argument0) {
	var filter_name = string_lower(argument0);
	global.effect_successful=true;
	with(obj_player){
	mid_effect = true;
		for (var i = 0; i < deckCount; i++){
			if (string_lower(macros.name[deck[i,0]]) == filter_name){
				var card_to_add = deck[i,0],
				art_to_add = deck[i,0];
				deck[i,0] = deck[deckCount-1,0];
				deck[i,1] = deck[deckCount-1,1];
				deck[deckCount-1,0] = card_to_add;
				deck[deckCount-1,1] = art_to_add;
				scr_draw(1, false);
				mid_effect = false;
				scr_message_last_action("Opponent searched" + macros.name[card_to_add]);
				scr_last_action("You searched" + macros.name[card_to_add]);
				return;
			}
		}
		global.effect_successful = false;
		mid_effect = false;//no legal targets
	}


}
