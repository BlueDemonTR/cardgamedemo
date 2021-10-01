function scr_card_sent_to_infirmary(argument0) {
	var sentCard = argument0;
	for(i=0;i<5;i++){
		if(obj_player.field[i,0]==55){
			if(macros.card_type[sentCard] != TypeSpell && !obj_player.fieldCard[i].cardStatus[StatusSilenced]){
				obj_player.fieldCard[i].cardStat[StatATK]++;
				scr_message_field_card_stats(i)
			}
		}
	}


}
