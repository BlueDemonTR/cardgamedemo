// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_momentum_deck_filter(filterNum){
	var cardCount = 0;
	for (var i=0;i < momentumDeckCount;i++){
		if(scr_check_filter(obj_player.momentum_deck[i,0], filterNum)){cardCount++;}
	}
	return cardCount;
}