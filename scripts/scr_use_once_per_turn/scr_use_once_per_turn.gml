// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_use_once_per_turn(player, position){
	if(!controller.field[position]){
		return;
	}
	var affectedCard = controller.fieldCard[position];
	
	affectedCard.effectUsesLeft = limit_between(affectedCard.effectUsesLeft -1, 0, 65535)
	
	scr_decide_field_card_stats(controller, position)	
}