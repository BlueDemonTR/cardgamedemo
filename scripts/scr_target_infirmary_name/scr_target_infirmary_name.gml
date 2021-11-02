// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_infirmary_name(player, cardNum, arrayPos){
	var j = 0,
	filtered_cards;
	with(player){
		for (var i = 0; i < infirmaryCount; i++){
			if(infirmary[i, 0] == cardNum){
				filtered_cards[j++] = i
			}
		}
	}
	var filtered_card_count = j;	
	for (i = 0; i < filtered_card_count; i++){
		var card_x = room_width/2 - sprite_get_width(spr_base_white)/2 + card_width + (card_width+30)*i, 
		card_y = room_height/2 - sprite_get_height(spr_base_white)/2 + card_height/2 + 20;
		with(instance_create_layer(card_x, card_y, "UpperInstances", obj_legal_targets)){
			position = filtered_cards[i];
			self.player = player
			self.arrayPos = arrayPos
			self.cardNum = obj_player.infirmary[position, 0];
			artNum = obj_player.infirmary[position,1];
			current_function = SelectInfirmary;
			length = filtered_card_count;
		}
	}
	if(filtered_card_count == 0){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97
	}
}