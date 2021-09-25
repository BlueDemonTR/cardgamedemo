// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_find_infirmary(player ,cardNum){
	with(player){
		for(var i = 0; i < infirmaryCount; i++){
			if(infirmary[i,0] == cardNum){
				return i;
			}
		}
	}
	if(object_index == obj_player){resolutionPile[resolutionPileCount-1,2] = 97}
}