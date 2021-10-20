draw_sprite(sprite_index,-1,x,y)
draw_set_font(fnt_default)
draw_set_color(c_black)
if(activation_mode == FunctionHandEffect){
	draw_text(x-55,y-30,activation_mode);
}else if(activation_mode == FunctionChoices){
	draw_text(x-55,y-30,choiceText);
}else{
	draw_text(x-35,y-30,activation_mode);
}

