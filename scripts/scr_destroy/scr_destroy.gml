function scr_destroy(player, position, destroyType) {
	//Destroys player.fieldCard[position]
	//destroyType is either 0 (Injuries) or 1 (Effect)
	if(!player.field[position, 0]){return}
	
	var
	affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum;

	if(affectedCard.getStat(StatHP) > 0 && affectedCard.getStatus(StatusIndestructable)){
		return;
	}

	var infirmaryPos = scr_send_infirmary(player, [cardNum, artNum], destroyType)
	
	scr_remove_from_field(player, position, destroyType)
	
	scr_on_destroyed(cardNum, player, infirmaryPos, destroyType);
	return;
}
