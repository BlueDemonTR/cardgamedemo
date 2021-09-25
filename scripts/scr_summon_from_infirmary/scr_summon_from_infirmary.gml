function scr_summon_from_infirmary(infirmaryPos, summonZone) {
	var cardNum = infirmary[infirmaryPos,0],
	artNum = infirmary[infirmaryPos,1];
		
		
	if(!scr_summon(summonedCard, summonedArt, player, "effect", "playerInfirmaryToField", summonZone)){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97;
		return;
	}

	scr_remove_from_infirmary(infirmaryPos);
}
