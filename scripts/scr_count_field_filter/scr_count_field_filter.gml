// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_field_filter(player, filterNum, checkTargetable){
	var cardCount;
	for (var i=0;i < 5;i++){
		if(scr_check_filter(player.field[i,0], filterNum) && (!checkTargetable || !player.fieldCard[i].cardStatus[StatusSneaky])){cardCount++;}
	}
	return cardCount;
}