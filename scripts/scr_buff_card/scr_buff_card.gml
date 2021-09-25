// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buff_card(controller, position, levelBuff, atkBuff, maxHpBuff, hpBuff, armorBuff, regenerationBuff, dodgeBuff){
	var affectedCard = controller.fieldCard[position];
	if(affectedCard.cardStatus[3]){return}
	affectedCard.cardStat[0] += levelBuff
	affectedCard.cardStat[1] += atkBuff
	affectedCard.cardStat[2] += maxHpBuff
	affectedCard.cardStat[3] += hpBuff	
	affectedCard.cardStat[4] += armorBuff
	affectedCard.cardStat[5] += regenerationBuff
	affectedCard.cardStat[6] += dodgeBuff
	if(controller = obj_player){
		scr_message_field_card_stats(position)
	}else if(controller = obj_opponent){
		scr_message_opponent_field_card_stats(position)
	}
}