// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_card_status(controller, position, status, value){
	if(!controller.field[position]){
		return false;
	}
	var affectedCard = controller.fieldCard[position];
	
	if(affectedCard.cardStatus[StatusImmune]){return}
	
	affectedCard.cardStatus[status] = value
	
	if(controller = obj_player){
		scr_message_field_card_stats(position)
	}else if(controller = obj_opponent){
		scr_message_opponent_field_card_stats(position)
	}
}