draw_set_font(fnt_default)
if(chosen_wheel == 0){
	draw_sprite_ext(sprite_index, -1, x, y, .45, .45, 0, c_gray, 1);
	draw_text(x - (string_width("No Wheel") - 95), y, "No Wheel");
	return;
}

draw_self();
draw_set_color(c_black);
draw_set_font(fnt_default);
draw_text(x - (string_width(macros.wheel_name[chosen_wheel]) - 95), y, macros.wheel_name[chosen_wheel]);
	
if (mouse_between(1620, 55, 1680, 120)){
	draw_sprite(spr_shared_effect_box,-1, mouse_x - 400, mouse_y);
	draw_text_ext(mouse_x - 390,mouse_y + 10, macros.momentum_gain[chosen_wheel], 16, 380);
}	
if(point_distance(mouse_x, mouse_y, 1760, 90) < 80){
	if (mouse_x < 1765 && mouse_y < 95){
		draw_sprite(spr_shared_effect_box, -1, mouse_x - 400, mouse_y);
		draw_text_ext(mouse_x - 390, mouse_y + 10, macros.wheel_ability[chosen_wheel,0], 16, 380);
	}else if (mouse_x > 1760 && mouse_y < 90){
		draw_sprite(spr_shared_effect_box, -1, mouse_x - 400, mouse_y);
		draw_text_ext(mouse_x - 390, mouse_y + 10, macros.wheel_ability[chosen_wheel,1], 16, 380);
	}else if (mouse_x < 1760 && mouse_y > 90){
		draw_sprite(spr_shared_effect_box, -1 ,mouse_x - 400, mouse_y);
		draw_text_ext(mouse_x - 390 ,mouse_y + 10 ,macros.wheel_ability[chosen_wheel,3], 16, 380);
	}else{
		draw_sprite(spr_shared_effect_box,-1,mouse_x-400,mouse_y);
		draw_text_ext(mouse_x - 390, mouse_y + 10, macros.wheel_ability[chosen_wheel,2], 16, 380);
	}
}
