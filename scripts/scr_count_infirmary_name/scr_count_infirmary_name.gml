// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_infirmary_name(player, cardNum, sendType){
	var cardCount = 0;
	for(var i = 0; i < player.infirmaryCount; i++){
		if(player.infirmary[i, 0] == cardNum && (player.infirmary[i, 2] == sendType || sendType == -1)){
			cardCount++;
		}
	}
	return cardCount;
}