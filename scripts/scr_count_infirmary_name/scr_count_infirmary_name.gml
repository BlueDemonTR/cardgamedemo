// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_infirmary_name(player, cardNum, destructionType){
	var cardCount = 0;
	for(var j = 0; j < player.infirmaryCount; j++){
		if(player.infirmary[i,0] == cardNum && (player.infirmary[i,2] == destructionType || "any" == destructionType)){
			cardCount++;
		}
	}
	return cardCount;
}