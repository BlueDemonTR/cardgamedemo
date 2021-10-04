// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_search(player, deckPos){
	with(player){
		cardNum = deck[deckPos,0];
		artNum = deck[deckPos,1];
		deck[deckPos] = [deck[deckCount-1,0], deck[deckCount-1,1]];
		deck[deckCount-1] = [cardNum, artNum];
		scr_draw(player, 1, false);
		scr_shuffle_deck(player);
	}
}