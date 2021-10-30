// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_choose_field_zones(activator, players, selectFilled, selectNMZ, selectMMZ, arrayPos){
	var effectSuccessful = false;
	
	if(activator.object_index == obj_opponent){
		scr_message_ask_response(RESPONSE_CHOOSE_FIELD_ZONE, players, selectFilled, selectNMZ, selectMMZ, arrayPos)
		return;
	}
	
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
		if(obj_player.own_turn){
			resolvingPile[obj_player.resolvingPileCount-1,2] = 97;
			return;
		}
		scr_message_handle_fail()
	}
}