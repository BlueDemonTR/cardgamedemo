// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_momentum_deck_impact(player, wheelNum, arrayPos){
	var summonableMonsters = scr_count_impact(player)
	
	for(var i = 0; i < array_length(summonableMonsters); i++){
		with(instance_create_layer(525+((card_width+30)*i), room_height/2, "UpperInstances",obj_legal_targets)){
			self.player = player;
			position = summonableMonsters[i];
			self.arrayPos = arrayPos
			cardNum = self.player.momentumDeck[position, 0];
			artNum = self.player.momentumDeck[position,1];
			current_function = "momentumDeck";
		}
	}
	if(summonableMonsters == []){
		resolvingPile[obj_player.resolvingPileCount-1,2] = 97
	}
}