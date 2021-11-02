// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_momentum_deck_impact(player, wheelNum, arrayPos){
	var summonableMonsters = scr_count_impact(player)
	
	for(var i = 0; i < array_length(summonableMonsters); i++){
		var card_x = room_width/2 - sprite_get_width(spr_base_white)/2 + card_width + (card_width+30)*i, 
		card_y = room_height/2 - sprite_get_height(spr_base_white)/2 + card_height/2 + 20;
		with(instance_create_layer(card_x, card_y, "UpperInstances", obj_legal_targets)){
			self.player = player;
			position = summonableMonsters[i];
			self.arrayPos = arrayPos
			cardNum = self.player.momentumDeck[position, 0];
			artNum = self.player.momentumDeck[position,1];
			current_function = SelectMomentum;
			length = array_length(summonableMonsters);
		}
	}
	if(summonableMonsters == []){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97
	}
}