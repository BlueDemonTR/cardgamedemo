function scr_remove_from_hand(position) {
	obj_player.handCount--
				obj_player.hand[position,0] = 0;
				obj_player.hand[position,1] = 0;
				
				for (var j = position; j < obj_player.handCount; j++){
					obj_player.hand[j,0] = obj_player.hand[j+1,0];
					obj_player.hand[j,1] = obj_player.hand[j+1,1];
					if (j < obj_player.handCount){
						obj_player.handCard[j] = obj_player.handCard[j+1];
						obj_player.handCard[j].hand_position--;
						obj_player.handCard[j].depth--;
					}
				}
	obj_player.handCard[obj_player.handCount] = noone
	obj_player.hand[obj_player.handCount,0] = 0
	obj_player.hand[obj_player.handCount,1] = 0
	scr_message_hand_change();	
	return;


}
