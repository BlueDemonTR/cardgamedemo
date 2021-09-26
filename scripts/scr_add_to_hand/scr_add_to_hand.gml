// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_to_hand(player, cardNum, artNum){
	if(player.handCount >= handSizeLimit){return;}
	if(player = obj_player){
		hand[handCount,0] = cardNum
		hand[handCount,1] = artNum
	
		handCard[handCount] = instance_create_depth(deck_x, deck_y, -handCount-2, obj_card);
		with(handCard[handCount]){
			card_drawn = true;
			hand_position = player.handCount;
			cardNum = player.hand[hand_position,0];
			artNum = player.hand[hand_position,1];
		}
		handCount++
		scr_message_hand_change()
		return hand[handCount-1];
	}
	hand[handCount,0] = field[field_location,0]
	hand[handCount++,1] = field[field_location,1]
	scr_message_opponent_hand_change();
	return hand[handCount-1];
}