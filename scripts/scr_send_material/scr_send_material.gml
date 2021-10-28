// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_send_material(player, position, summonedCard){
	if(!player.field[position, 0]){return}
	
	var
	affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum;

	var infirmaryPos = scr_send_infirmary(player, [cardNum, artNum], SendMaterial)
	
	scr_remove_from_field(player, position, "destroy")
	
	scr_on_material(cardNum, player, summonedCard)
	return infirmaryPos;
}