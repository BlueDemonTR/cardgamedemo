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
		legal_targets[i] = instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets);
		with(legal_targets[i]){
			position = filtered_cards[i];
			self.arrayPos = arrayPos
			cardNum = obj_player.infirmary[position, 0];
			artNum = obj_player.infirmary[position,1];
			current_function = "infirmary";
		}
	}
	if(filtered_card_count == 0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}