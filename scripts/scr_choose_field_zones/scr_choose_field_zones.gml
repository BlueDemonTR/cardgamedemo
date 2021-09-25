// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_choose_field_zones(selectPlayer, selectOpponent, selectFilled, selectNMZ, selectMMZ, arrayPos){
	var effectSuccessful = false;
	for(var i = (!selectNMZ * 4); i < obj_player.field_zone_count - (!selectMMZ); i++){
		if(selectPlayer && (selectFilled || obj_player.field[i] == 0)){
			effectSuccessful = true;
			with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
				player=obj_player;
				position = i;
				self.current_function = "chooseZone";
				self.arrayPos = arrayPos
				x = player.field_card_zone_x[field_location];
				y = player.field_card_zone_y[field_location];
			}
		}
		if(selectOpponent && (selectFilled || obj_opponent.field[i] == 0)){
			effectSuccessful = true;
			with(instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)){
				player=obj_opponent;
				position = i;
				self.current_function = "chooseZone";
				self.arrayPos = arrayPos
				x = player.field_card_zone_x[field_location];
				y = player.field_card_zone_y[field_location];
			}
		}
	}
	if(!effectSuccessful){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97;
	}
}