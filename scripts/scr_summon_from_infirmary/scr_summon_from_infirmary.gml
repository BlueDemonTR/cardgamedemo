function scr_summon_from_infirmary(player, infirmaryPos, summonZone) {
	var cardNum = player.infirmary[infirmaryPos,0],
	artNum = player.infirmary[infirmaryPos,1];
		
		
	if(!scr_summon([cardNum, artNum], player, SummonEffect, "playerInfirmaryToField", summonZone)){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
		return;
	}

	scr_remove_from_infirmary(player, infirmaryPos);
}
