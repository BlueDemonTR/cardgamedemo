// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_hand_filter(filterNum, ignoreTarget){
	var cardCount = 0;
	with(obj_player){
		for (var i = 0; i < handCount; i++){
			if(scr_check_filter(hand[i,0],filterNum)){
				if(i=ignoreTarget){continue;}
				cardCount++
			}
		}
	}
	return cardCount
}