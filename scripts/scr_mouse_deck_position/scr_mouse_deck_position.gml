// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mouse_deck_position(x,y){
	var column,
	line;
	
	if(x > 420 && x < 1520 && y > 170 && y < 810){
		if (deckCount <= 40){
			column = int64((x-420)/small_card_width)
			line = int64((y-170)/small_card_height)
			return (line*10)+column
		}else{
			column = int64((x-420)/small_card_width*1.55)
			line = int64((y-170)/small_card_height)
			return min((line*15)+column,(line*15)+14)
		}
	}
	else if(x > 420 && x < 1190 && y > 850 && y < 1010){
		return 100+int64((x-420)/small_card_width)
	}
	return -1;
}