function scr_remove_from_infirmary(player, infirmaryPos) {
	//Removes a card from the infirmary
	for (var i = infirmaryPos; i < player.infirmaryCount; i++){
		infirmary[i] = infirmary[i+1];
	}
	infirmaryCount--;
	scr_update_infirmary();
	scr_decide_infirmary(player);
}
