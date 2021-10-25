function scr_set_stat_player(player, stat, value){
	
	player.playerStat[stat] = value
	
	//scr_check_max_player()
	scr_decide_stats(player)
}