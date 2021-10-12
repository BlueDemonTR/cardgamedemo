// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_send_infirmary(player, cardArray, sendType){
	scr_card_sent_to_infirmary(cardArray[0], sendType)
	player.infirmary[player.infirmaryCount] = cardArray;
	player.infirmary[player.infirmaryCount,2] = sendType;
	scr_decide_infirmary(player);
	
	return player.infirmaryCount++
}