// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_if_field_full(player){
	with(player){
		for(var i = 0; i < 4; i++){
			if(player.field[i, 0] == 0){
				return false
			}
		}
	}
	return true;
}