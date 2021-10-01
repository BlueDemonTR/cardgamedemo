// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buff_card(controller, position, levelBuff, atkBuff, maxHpBuff, hpBuff, armorBuff, regenerationBuff, dodgeBuff){
	var affectedCard = controller.fieldCard[position];
	if(affectedCard.cardStatus[StatusImmune]){return}
	affectedCard.cardStat[StatLevel] += levelBuff
	affectedCard.cardStat[StatATK] += atkBuff
	affectedCard.cardStat[StatMaxHP] += maxHpBuff
	affectedCard.cardStat[StatHP] += hpBuff	
	affectedCard.cardStat[StatArmor] += armorBuff
	affectedCard.cardStat[StatRegeneration] += regenerationBuff
	affectedCard.cardStat[StatDodge] += dodgeBuff
	if(controller = obj_player){
		scr_message_field_card_stats(position)
	}else if(controller = obj_opponent){
		scr_message_opponent_field_card_stats(position)
	}
}