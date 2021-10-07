// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mill(player, deckPos){
	with(player){
		var cardArray = deck[deckPos];
		deck[deckPos] = deck[deckCount-1];
		deck[deckCount-1] = cardArray;
		scr_mill_from_top(player, 1);
		scr_shuffle_deck(player);
	}
}