// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_count_field(player){
	var cardCount;
	for (var i=0; i < player.field_zone_count; i++){
		if(player.field[i,0] != 0){cardCount++;}
	}
	return cardCount;
}