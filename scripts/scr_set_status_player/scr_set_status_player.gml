function scr_set_status_player(player, status, value){
	
	player.playerStatus[status] = value
	
	scr_decide_stats(player)
}