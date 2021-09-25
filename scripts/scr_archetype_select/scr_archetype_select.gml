function scr_archetype_select(argument0, argument1, argument2) {
	var temp1 = argument0,
	temp2 = argument1,
	temp3 = argument2,
	i = 0,
	j = 0;
	for (i=0; i < total_cards; i++){
	filtered_cards[i] = 0;
	}
	for (i=0; i < total_cards; i++){
	if(archetype1[i] == temp1){filtered_cards[j++]=card_number[i];}
	else if(archetype2[i] == temp1){filtered_cards[j++]=card_number[i];}
	else if(archetype3[i] == temp1){filtered_cards[j++]=card_number[i];}
	else if(archetype1[i] == temp2){filtered_cards[j++]=card_number[i];}
	else if(archetype2[i] == temp2){filtered_cards[j++]=card_number[i];}
	else if(archetype3[i] == temp2){filtered_cards[j++]=card_number[i];}
	else if(archetype1[i] == temp3){filtered_cards[j++]=card_number[i];}
	else if(archetype2[i] == temp3){filtered_cards[j++]=card_number[i];}
	else if(archetype3[i] == temp3){filtered_cards[j++]=card_number[i];}

	}
	filtered_card_count = j;



}
