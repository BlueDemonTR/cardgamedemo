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
			self.player = player
			self.arrayPos = arrayPos
			self.cardNum = obj_player.infirmary[position, 0];
			artNum = obj_player.infirmary[position,1];
			current_function = SelectInfirmary;
		}
	}
	if(filtered_card_count == 0){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97
	}
}