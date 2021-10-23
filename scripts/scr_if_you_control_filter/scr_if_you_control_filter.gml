// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_if_you_control_filter(filterNum){
	for (var i = 0;i < 5;i++){
		if(scr_check_filter(obj_player.field[i, 0], i, filterNum)){
			return true;
		}
	}
	return false;
}