// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_search(deckPos){
	with(obj_player){
		card_to_add = deck[deckPos,0];
		art_to_add = deck[deckPos,1];
		deck[deckPos,0] = deck[deckCount-1,0];
		deck[deckPos,1] = deck[deckCount-1,1];
		deck[deckCount-1,0] = card_to_add;
		deck[deckCount-1,1] = art_to_add;
		scr_draw(1, false);
		scr_shuffle_deck();
		scr_message_last_action("Opponent searched" + macros.name[card_to_add]);
		scr_last_action("You searched" + macros.name[card_to_add]);
	}
}