function scr_remove_from_hand(player, position){
	if(!player.hand[position]){
		return false;
	}
	
	player.handCount--
	player.hand[position] = [0, 0]
	
	for (var j = position; j < player.handCount; j++){
		player.hand[j] = player.hand[j+1];
		
		if (player == obj_player && j < player.handCount){
			player.handCard[j] = player.handCard[j+1];
			player.handCard[j].hand_position--;
			player.handCard[j].depth--;
		}
	}
	
	if (player == obj_player){
		player.handCard[player.handCount] = noone
	}
	player.hand[player.handCount] = [0, 0]
	
	scr_decide_hand_change();	
	return;
}
