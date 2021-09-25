// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pay_momentum(amount){
	if(player.momentum < amount){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
		return;
	}
	player.momentum -= amount
}