function scr_filter_words(argument0) {
	var temp1 = string_lower(argument0), j=0;
	for (var i = 1; i < macros.total_cards;i++){
		if(!scr_card_is_illegal(i)){
			show_debug_message(macros.origText[i])
			if(string_count(temp1,string_lower(macros.name[i])) || string_count(temp1,string_lower(macros.origText[i,0]))){
				filtered_cards[j++] = i;
			}
		}
	}
	filtered_card_count = j;



}
