// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_target_hand(filterNum, arrayPos, ignoreTarget){
	var j = 0,
	filtered_cards;
	with(obj_player){
		for (var i = 0; i < handCount; i++){
			if(scr_check_filter(hand[i,0],filterNum)){
				if(i=ignoreTarget){continue;}
				filtered_cards[j++] = i
			}
		}
	}
	filtered_card_count = j;	
	for (var i=0; i < filtered_card_count; i++){
		target_select[i] = instance_create_layer(x,y,"UpperInstances",obj_appropiate_targets)
		with(target_select[i]){
			player=obj_player;
			self.arrayPos = arrayPos			
			position = filtered_cards[i];
			current_function = "hand";
			x=player.handCard[i].x
			y=player.handCard[i].y
		}
		
	}

	if(filtered_card_count==0){
		resolutionPile[obj_player.resolutionPileCount-1,2] = 97
	}
}