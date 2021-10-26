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
	
	with(player.fieldCard[position]){
		animationType = "destroy"
		instance_destroy();
	}	
	scr_decide_field(player, position, 0, 0, "destroy")
	
	scr_on_destroyed(cardNum, infirmaryPos, destroyType);
	return;
}
