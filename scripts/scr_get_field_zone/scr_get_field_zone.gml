// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_field_zone(x, y, player){
	for(var i = 0; i < player.field_zone_count - 1; i++){
		if (x < player.field_card_zone_x[i] - card_width/2){continue;} 
		if (x > player.field_card_zone_x[i] + card_width/2){continue;}
		
		if (y < player.field_card_zone_y[i] - card_height/2){continue;}
		if (y > player.field_card_zone_y[i] + card_height/2){continue;}
		
		return i;
	}
	return -1
}