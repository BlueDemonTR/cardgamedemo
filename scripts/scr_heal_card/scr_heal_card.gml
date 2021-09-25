// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_heal_card(controller, position, hpBuff){
	var affectedCard = controller.fieldCard[position];
	if(affectedCard.cardStatus[3]){return}
	scr_buff_card(controller, position, 0, 0, 0, hpBuff, 0, 0, 0)
	if(controller = obj_player){
		scr_message_field_card_stats(position)
	}else if(controller = obj_opponent){
		scr_message_opponent_field_card_stats(position)
	}
}