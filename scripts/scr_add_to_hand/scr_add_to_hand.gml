// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_to_hand(player, cardArray){
	if(player.handCount >= handSizeLimit){return;}
	
	hand[handCount] = cardArray;
	if(player == obj_player){
		handCard[handCount] = instance_create_depth(player.deck_x, player.deck_y, -(player.handCount)-2, obj_card);
		with(handCard[handCount]){
			card_drawn = true;
			hand_position = player.handCount;
			cardNum = player.hand[hand_position,0];
			artNum = player.hand[hand_position,1];
		}
	}
	handCount++
	scr_decide_hand_change(player);
	return hand[handCount-1];
}