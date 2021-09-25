draw_set_font(fnt_default)
if(chosen_wheel=0){
	draw_sprite_ext(sprite_index,-1,x,y,.45,.45,0,c_gray,1)
	draw_text(x-(string_width("No Wheel")-95),y,"No Wheel")
}else{
	draw_self()
	draw_set_color(c_black);
	draw_set_font(fnt_default);
	draw_text(x-(string_width(macros.wheel_name[chosen_wheel])-95),y,macros.wheel_name[chosen_wheel]);
	if (mouse_y > 55 && mouse_y < 120 && mouse_x < 1680 && mouse_x > 1620){
		draw_sprite(spr_shared_effect_box,-1,mouse_x-400,mouse_y)
		draw_text_ext(mouse_x-390,mouse_y+10,macros.momentum_gain[chosen_wheel],16,380)
	}	
	if(point_distance(mouse_x,mouse_y,1760,90) < 80){
		if (mouse_x < 1760 && mouse_y < 90){
			draw_sprite(spr_shared_effect_box,-1,mouse_x-400,mouse_y)
			draw_text_ext(mouse_x-390,mouse_y+10,macros.wheel_ability_1[chosen_wheel],16,380)
		}
		else if (mouse_x > 1760 && mouse_y < 90){
			draw_sprite(spr_shared_effect_box,-1,mouse_x-400,mouse_y)
			draw_text_ext(mouse_x-390,mouse_y+10,macros.wheel_ability_2[chosen_wheel],16,380)
		}

		else if (mouse_x < 1760 && mouse_y > 90){
			draw_sprite(spr_shared_effect_box,-1,mouse_x-400,mouse_y)
			draw_text_ext(mouse_x-390,mouse_y+10,macros.wheel_ability_4[chosen_wheel],16,380)
		}
		else{
			draw_sprite(spr_shared_effect_box,-1,mouse_x-400,mouse_y)
			draw_text_ext(mouse_x-390,mouse_y+10,macros.wheel_ability_3[chosen_wheel],16,380)
		}		
		
	}
}
//}else{
//	draw_set_color(c_black);
//	draw_set_font(fnt_default);
//	draw_text(x+50,y-30,macros.wheel_name[chosen_wheel]);
//	if(mouse_x >= 730 && mouse_y >= 30 && mouse_x < 1185 && mouse_y < 120){
//		if (mouse_x < 821){
//			draw_text(mouse_x+20,mouse_y+20,macros.momentum_gain[chosen_wheel])
//		}
//		else if (mouse_x <= 912){
//			draw_text(mouse_x+20,mouse_y+20,macros.wheel_ability_1[chosen_wheel])
//		}
//		else if (mouse_x <= 1003){
//			draw_text(mouse_x+20,mouse_y+20,macros.wheel_ability_2[chosen_wheel])
//		}
//		else if (mouse_x <= 1094){
//			draw_text(mouse_x+20,mouse_y+20,macros.wheel_ability_3[chosen_wheel])
//		}
//		else{
//			draw_text(mouse_x+20,mouse_y+20,macros.wheel_ability_4[chosen_wheel])
//		}
		
//	}
//}