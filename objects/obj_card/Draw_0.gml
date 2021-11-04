draw_sprite_stretched(
	macros.sprite_array[cardNum,artNum], -1,
	x - card_width/2, y - card_height/2,
	card_width,card_height
);

if(macros.card_type[cardNum] != TypeSpell){
	draw_set_color(c_red)
	draw_text(x - 62, y - 76, string(scr_get_stat_orig(cardNum, StatATK)));

	draw_set_color(macros.card_type[cardNum] == TypeMonster ? $18742d : $0c3f18)
	draw_text(x + 50, y - 76,string(scr_get_stat_orig(cardNum, StatMaxHP)));
}

if(selected && player.open_game_state && player.own_turn && player.main_phase){
	x = mouse_x;
	y = mouse_y;
	depth = -1000;
}else{
	depth = -position;
}