// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_status_card(controller, position, status, value){
	var affectedCard = controller.fieldCard[position];
	if(!instance_exists(affectedCard)){return false;}
	
	if(affectedCard.getStatus(StatusImmune)){return}
	
	affectedCard.cardStatus[status] = value
	
	scr_decide_field_card_stats(controller, position)

}