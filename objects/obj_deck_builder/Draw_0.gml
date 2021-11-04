draw_set_font(fnt_upheaval_big);
draw_set_color(c_black);
draw_text(1343,105,monsterCount);

draw_set_color(c_white);
draw_text(1393,105,spellCount);

draw_set_color(c_black);
draw_text(1443,105,deckCount);

draw_text(1503,105,momentumDeckCount);

if(alarm[1] != -1){
	draw_sprite(spr_loading,-1,room_width/2,room_height/2);
}

for(var i = 0; i < deckCount; i++){
	if(deckCount > 40){
		maxLineSize = 15
	}else{
		maxLineSize = 10
	}
	maxLineCount = 4
	var cardNum = deck[i, 0],
	artNum = deck[i,1];
	if(deckCount > 40){
		var card_x = 475 + (i mod maxLineSize)*(small_card_width/1.55),
		card_y = 250 + int64(i/maxLineSize)*small_card_height;
	}else{
		var card_x = 475 + (i mod maxLineSize)*small_card_width,
		card_y = 250 + int64(i/maxLineSize)*small_card_height
	}
	draw_sprite_ext(macros.sprite_array[cardNum,artNum], -1, card_x, card_y,small_card_width/550,small_card_height/800,0,c_white,1)
	draw_set_font(fnt_default)
	if(macros.card_type[cardNum] != TypeSpell){
		draw_set_color(c_red)
		draw_text(card_x - 50, card_y - 62, string(scr_get_stat_orig(cardNum, StatATK)));

		draw_set_color($18742d)
		draw_text(card_x + 38, card_y - 62,string(scr_get_stat_orig(cardNum, StatMaxHP)));
	}
}
for(var i = 0; i < momentumDeckCount; i++){
	var cardNum = momentumDeck[i,0],
	artNum = momentumDeck[i,1],
	card_x = 475 + i*small_card_width,
	card_y = 850 + small_card_height/2;
	
	draw_sprite_ext(macros.sprite_array[cardNum,artNum],-1, card_x, card_y,small_card_width/550,small_card_height/800,0,c_white,1)
	
	draw_set_color(c_red)
	draw_text(card_x - 50, card_y - 62, string(scr_get_stat_orig(cardNum, StatATK)));

	draw_set_color($0c3f18)
	draw_text(card_x + 38, card_y - 62,string(scr_get_stat_orig(cardNum, StatMaxHP)));
}