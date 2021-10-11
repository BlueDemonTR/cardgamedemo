draw_set_font(fnt_upheaval_big)
draw_set_color(c_black)
draw_text(1343,105,monsterCount)
draw_set_color(c_white)
draw_text(1393,105,spellCount)
draw_set_color(c_black)
draw_text(1443,105,deckCount)
draw_text(1503,105,momentumDeckCount)
if(alarm[1] != -1){
	draw_sprite(spr_loading,-1,room_width/2,room_height/2)
}
for(var i = 0; i < deckCount; i++){
	if(deckCount > 40){
		maxLineSize = 15;
	}else{maxLineSize = 10}
		maxLineCount = 4;
	if(deckCount > 40){
		draw_sprite_ext(macros.sprite_array[deck[i, 0],deck[i, 1]],-1,475 + (i mod maxLineSize)*(small_card_width/1.55),250 + int64(i/maxLineSize)*small_card_height,small_card_width/550,small_card_height/800,0,c_white,1)
	}else{	
		draw_sprite_ext(macros.sprite_array[deck[i, 0],deck[i, 1]],-1,475 + (i mod maxLineSize)*small_card_width,250 + int64(i/maxLineSize)*small_card_height,small_card_width/550,small_card_height/800,0,c_white,1)
	}
}
for(var i = 0; i < momentumDeckCount; i++){
	draw_sprite_ext(macros.sprite_array[momentumDeck[i, 0],momentumDeck[i, 1]],-1,475 + i*small_card_width,850+small_card_height/2,small_card_width/550,small_card_height/800,0,c_white,1)
}