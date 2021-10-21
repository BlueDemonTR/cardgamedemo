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
	if(object_index == obj_player){resolvingPile[resolvingPileCount-1,2] = 97}//TODO: Delay between resolving and resolution for debug purposes
}