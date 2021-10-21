// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_choose_field_zones(players, selectFilled, selectNMZ, selectMMZ, arrayPos){
	var effectSuccessful = false;
	
	for(var j = 0; j < array_length(players); j++){
		var player = players[j];
		for(var i = (!selectNMZ * 4); i < player.field_zone_count - (!selectMMZ); i++){
			if(selectFilled || !player.field[i,0]){
				effectSuccessful = true;
				with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
					self.player = player;
					position = i;
					current_function = TargetZone;
					self.arrayPos = arrayPos
					x = self.player.field_card_zone_x[position];
					y = self.player.field_card_zone_y[position];
				}
			}
		}
	}
	if(!effectSuccessful){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
	}
}