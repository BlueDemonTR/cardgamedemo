function scr_destroy(player, position, sendType) {
	//Destroys player.fieldCard[position]
	//sendType is either 0 (Injuries) or 1 (Effect)
	if(!player.field[position, 0]){  }
	
	var
	affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum;

	if(player.fieldCard[position].cardStat[StatHP] > 0 && player.fieldCard[position].cardStatus[StatusIndestructable]){
		return;
	}

	scr_send_infirmary(player, [cardNum, artNum], sendType)
	
	with(player.fieldCard[position]){
		animationType = "destroy"
		instance_destroy();
	}	
	scr_decide_field(player, position, cardNum, artNum, "destroy")
	
	scr_on_destroyed(cardNum, sendType);
	return;


}
