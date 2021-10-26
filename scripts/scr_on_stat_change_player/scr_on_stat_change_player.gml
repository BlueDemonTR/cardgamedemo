function scr_on_stat_change_player(player){
	for(var i = 0; i < array_length(player.playerStat); i++){
		var maxValue;
		switch(i){
			case PlayerHP:
				maxValue = player.getStat(PlayerMaxHP)
			break;
			case PlayerMana:
				maxValue = player.getStat(PlayerMaxMana)
			break;
			case PlayerMomentum:
				maxValue = player.getStat(PlayerMaxMomentum)
			break;
			default:
				maxValue = infinity
			break;
		}
		player.playerStat[i] = limit_between(player.getStat(i), 0, maxValue)
	}
	
	//Game over check
}