if(listPos >= main.filtered_card_count){
	return;
}
draw_sprite_ext(
	macros.sprite_array[cardNum,artNum], -1, 
	x, y,
	small_card_width/550, small_card_height/800,
	0, c_white, 1
)

draw_set_font(fnt_default)
if(macros.card_type[cardNum] != TypeSpell){
	draw_set_color(c_red)
	draw_text(x - 50, y - 62, string(scr_get_stat_orig(cardNum, StatATK)));

	draw_set_color(macros.card_type[cardNum] == TypeMonster ? $18742d : $0c3f18);
	draw_text(x + 38, y - 62,string(scr_get_stat_orig(cardNum, StatMaxHP)));
}

if(macros.sprite_count[cardNum] != 1){
	draw_sprite_ext(spr_altwork,-1,x,y,small_card_width/550,small_card_height/800,0,c_white,1);
}

draw_set_font(fnt_default);
draw_set_color(c_black);
start = y - small_card_height/2 + 10
widthCap = 100

start += draw_text_return_height(
	x + small_card_width/2 + 10, start,
	macros.name[cardNum],
	16, widthCap
)

draw_set_font(fnt_upheaval)

start += draw_text_return_height(
	x + small_card_width/2 + 10, 
	start, 
	string_upper(macros.typeName[macros.card_type[cardNum]]) + " CARD", 
	16, widthCap
)
