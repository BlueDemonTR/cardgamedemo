draw_sprite_stretched(macros.sprite_array[cardNum,artNum],-1,x-card_width/2,y-card_height/2,card_width,card_height);

if(cardNum> 0) {sprite_index = macros.sprite_array[cardNum,artNum];}

if(selected == true && !player.mid_effect && player.own_turn){
	x = mouse_x;
	y = mouse_y;
	depth = -1000;
}else {depth = -hand_position;}