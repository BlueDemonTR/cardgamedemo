// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_increase_stat_card(controller, position, changeStat, increase){
	if(!controller.field[position, 0]){return;}
	var affectedCard = controller.fieldCard[position];
	
	if(affectedCard.getStatus(StatusImmune)){return}
	
	var statMax = changeStat == StatLevel ? 12 : (changeStat == StatHP ? affectedCard.getStat(StatMaxHP) : 65535),
	statMin = changeStat == StatLevel ? 1 : 0;
	
	scr_set_stat_card(controller, position, changeStat, limit_between(affectedCard.getStat(changeStat) + increase, statMin, statMax))
	
	if(changeStat == StatMaxHP && affectedCard.getStat(StatMaxHP) < affectedCard.getStat(StatHP)){
		scr_set_stat_card(controller, position, StatHP, affectedCard.getStat(StatMaxHP))
	}
	scr_on_stat_change(affectedCard)
	
	scr_decide_field_card_stats(controller, position)
}