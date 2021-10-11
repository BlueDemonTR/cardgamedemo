// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buff_card(controller, position, levelBuff, atkBuff, maxHpBuff, hpBuff, armorBuff, regenerationBuff, dodgeBuff){
	if(!controller.field[position]){return;}
	var affectedCard = controller.fieldCard[position];
	
	if(affectedCard.cardStatus[StatusImmune]){return}
	
	affectedCard.cardStat[StatLevel] = limit_between(affectedCard.cardStat[StatLevel] + levelBuff, 0, 12)
	affectedCard.cardStat[StatATK] = limit_between(affectedCard.cardStat[StatATK] + atkBuff, 0, 65535)
	affectedCard.cardStat[StatMaxHP] = limit_between(affectedCard.cardStat[StatMaxHP] + maxHpBuff, 0, 65535)
	affectedCard.cardStat[StatHP] = limit_between(affectedCard.cardStat[StatHP] + hpBuff, 0, 65535)
	affectedCard.cardStat[StatArmor] = limit_between(affectedCard.cardStat[StatArmor] + armorBuff, 0, 65535)
	affectedCard.cardStat[StatRegeneration] = limit_between(affectedCard.cardStat[StatRegeneration] + regenerationBuff, 0, 65535)
	affectedCard.cardStat[StatDodge] = limit_between(affectedCard.cardStat[StatDodge] + dodgeBuff, 0, 65535)
	
	scr_on_stat_change(affectedCard)
	
	scr_decide_field_card_stats(controller, position)
}