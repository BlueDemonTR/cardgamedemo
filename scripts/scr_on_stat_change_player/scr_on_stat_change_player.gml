// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_on_stat_change(player){
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
		scr_set_stat_player(player, i, limit_between(player.getStat(i), 0, maxValue))
	}
	
	//Game over check
}