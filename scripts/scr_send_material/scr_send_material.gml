// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_send_material(player, position, summonedCard){
	if(!player.field[position, 0]){return}
	
	var
	affectedCard = player.fieldCard[position],
	cardNum = affectedCard.cardNum,
	artNum = affectedCard.artNum;

	var infirmaryPos = scr_send_infirmary(player, [cardNum, artNum], SendMaterial)
	
	with(player.fieldCard[position]){
		animationType = "material"
		instance_destroy();
	}	
	scr_decide_field(player, position, cardNum, artNum, "material")
	
	//scr_on_material
	return;
}