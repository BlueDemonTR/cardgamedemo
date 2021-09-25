function scr_mill_name(argument0) {
	var filter_name = string_lower(argument0);
	with(obj_player){
	mid_effect=true;
		for (var i = 0; i < deckCount; i++){
			if (string_lower(name[deck[i]]) == filter_name){
				card_to_add = deck[i];
				deck[i] = deck[deckCount-1];
				deck[deckCount-1] = card_to_add;
				scr_mill_from_top(1);
				mid_effect=false;
				break;
			}
	
		}
	mid_effect=false;//no legal targets
	}


}
