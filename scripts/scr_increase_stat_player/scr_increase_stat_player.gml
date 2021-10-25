function scr_increase_stat_player(player, stat, increase){
	
	scr_set_stat_player(player, stat, player.playerStat[stat] + increase)
}