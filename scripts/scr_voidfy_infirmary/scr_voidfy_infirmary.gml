// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_voidfy_infirmary(player, infirmaryPos){
	//Voidfies a card from the infirmary
	//Why?: Some cards may have activatio triggers when a card is voidified
	
	with(player){
		scr_remove_from_infirmary(player, infirmaryPos)
	}
}