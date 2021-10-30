// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_decide_deck_change(player){
	switch(player.object_index){
		case obj_player:
			scr_message_deck_change()
		break;
		case obj_opponent:
			scr_message_opponent_deck_change()
		break;
	}
}
function scr_decide_field(player, position, cardNum, artNum, animationType){
	switch(player.object_index){
		case obj_player:
			scr_message_field(position, cardNum, artNum, animationType)
		break;
		case obj_opponent:
			scr_message_opponent_field(position, cardNum, artNum, animationType)
		break;
	}
}
function scr_decide_field_card_stats(player, position){
	switch(player.object_index){
		case obj_player:
			scr_message_field_card_stats(position)
		break;
		case obj_opponent:
			scr_message_opponent_field_card_stats(position)
		break;
	}
}
function scr_decide_hand_change(player){
	switch(player.object_index){
		case obj_player:
			scr_message_hand_change()
		break;
		case obj_opponent:
			scr_message_opponent_hand_change()
		break;
	}
}
function scr_decide_infirmary(player){
	switch(player.object_index){
		case obj_player:
			scr_message_infirmary()
		break;
		case obj_opponent:
			scr_message_opponent_infirmary()
		break;
	}
}
function scr_decide_momentum_deck(player){
	switch(player.object_index){
		case obj_player:
			scr_message_momentum_deck()
		break;
		case obj_opponent:
			scr_message_opponent_momentum_deck()
		break;
	}
}
function scr_decide_stats(player){
	switch(player.object_index){
		case obj_player:
			scr_message_stats()
		break;
		case obj_opponent:
			scr_message_opponent_stats()
		break;
	}
}