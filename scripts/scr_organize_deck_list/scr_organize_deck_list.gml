// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_organize_deck_list(){
	with(main){
		if(deckCount > 40){
			maxLineSize = 15;
		}else{maxLineSize = 10}
		maxLineCount = 4;

		for(var i=0; i < deckCount;i++){
			deckList[i].lineNum = int64(deckList[i].deckPos/maxLineSize);
			deckList[i].linePos = deckList[i].deckPos mod maxLineSize;
			if(deckCount <= 40){
				deckList[i].x = 475 + deckList[i].linePos*(small_card_width)
			}else{
				deckList[i].x = 475 + deckList[i].linePos*(small_card_width/3)	
			}
			deckList[i].y = 250+deckList[i].lineNum*small_card_height;			
		}
		
	}
}