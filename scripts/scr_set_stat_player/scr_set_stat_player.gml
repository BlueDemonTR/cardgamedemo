function scr_set_stat_player(player, stat, value){
	
	player.playerStat[stat] = value
	
	scr_on_stat_change_player(player)
	
	scr_decide_stats(player)
}