function scr_remove_from_hand(player, position){
	if(!player.hand[position, 0]){
		return false;
	}
	
	player.hand[position] = [0, 0]
	if (player == obj_player){
		instance_destroy(player.handCard[position])
		player.handCard[player.handCount] = noone
	}	

	for (var j = position; j < player.handCount - 1; j++){
		player.hand[j] = player.hand[j+1];
		
		if (player == obj_player && j < player.handCount){
			player.handCard[j] = player.handCard[j+1];
			player.handCard[j].position--;
			player.handCard[j].depth--;
		}
	}
	
	player.hand[player.handCount--] = [0, 0]
	
	scr_decide_hand_change(player);	
	return;
}
