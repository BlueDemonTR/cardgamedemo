// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_add_to_hand(player, cardArray){
	if(player.handCount >= handSizeLimit){return;}
	
	player.hand[player.handCount] = cardArray;
	if(player == obj_player){
		player.handCard[player.handCount] = instance_create_depth(player.deck_x, player.deck_y, -(player.handCount)-2, obj_card);
		with(player.handCard[player.handCount]){
			card_drawn = true;
			position = player.handCount;
			cardNum = player.hand[position,0];
			artNum = player.hand[position,1];
		}
	}
	player.handCount++
	scr_decide_hand_change(player);
	return player.hand[player.handCount-1];
}