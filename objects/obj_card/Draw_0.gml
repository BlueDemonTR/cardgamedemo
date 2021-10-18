draw_sprite_stretched(macros.sprite_array[cardNum,artNum],-1,x-card_width/2,y-card_height/2,card_width,card_height);

if(cardNum> 0) {sprite_index = macros.sprite_array[cardNum,artNum];}

if(selected && player.open_game_state && player.own_turn && player.main_phase){
	x = mouse_x;
	y = mouse_y;
	depth = -1000;
}else{
	depth = -position;
}
draw_set_color(c_yellow)
draw_text(x,y, position)