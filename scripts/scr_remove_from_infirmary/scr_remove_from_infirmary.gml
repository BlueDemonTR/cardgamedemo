function scr_remove_from_infirmary(player, infirmaryPos) {
	//Removes a card from the infirmary
	for (var i = infirmaryPos; i < player.infirmaryCount - 1; i++){
		player.infirmary[i] = player.infirmary[i+1];
	}
	player.infirmary[player.infirmaryCount--] = [0,0,0];
	scr_update_infirmary();
	scr_decide_infirmary(player);
}
