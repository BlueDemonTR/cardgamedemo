draw_set_font(fnt_default)
draw_set_color(c_black)
if(obj_player.wheel_locked){
	lockColor = c_gray
}else{
	lockColor = c_white
}
if(obj_player.momentum <= 12 && obj_player.momentum >= 0){
	draw_sprite_ext(wheelSprite[obj_player.momentum],-1,x,y,1,1,0,lockColor,1);
}
else if(obj_player.momentum > 12){
	draw_sprite_ext(wheelSprite[12],-1,x,y,1,1,0,lockColor,1);
}else{
	draw_sprite_ext(wheelSprite[0],-1,x,y,1,1,0,lockColor,1);
}
if(instance_exists(obj_opponent)){
	
	if(obj_opponent.momentum <= 12){
		draw_sprite_ext(wheelSprite[obj_opponent.momentum],-1,1300,400,1,1,180,c_white,1)
	}
	else{
		draw_sprite_ext(wheelSprite[12],-1,1300,400,1,1,180,c_white,1)	
	}
}
if(chosen_wheel > 0){
	if(mouse_between(613, 673, 676, 850)){
		depth=-5
		if (mouse_between(630, 673, 676, 717)){
			draw_text(mouse_x+20,mouse_y,wheel_ability[chosen_wheel, 3])
			if(mouse_check_button_released(mb_left)){scr_wheel_effects(chosen_wheel,4)}
		}
		else if (mouse_between(630, 717, 676, 760)){
			draw_text(mouse_x+20,mouse_y,wheel_ability[chosen_wheel, 2])
			if(mouse_check_button_released(mb_left)){scr_wheel_effects(chosen_wheel,3)}
		}
		else if (mouse_between(630, 760, 676, 804)){
			draw_text(mouse_x+20,mouse_y,wheel_ability[chosen_wheel, 1])
			if(mouse_check_button_released(mb_left)){scr_wheel_effects(chosen_wheel,2)}
		}
		else if (mouse_between(630, 804, 676, 850)){
			draw_text(mouse_x+20,mouse_y,wheel_ability[chosen_wheel, 0])
			if(mouse_check_button_released(mb_left)){scr_wheel_effects(chosen_wheel,1)}
		}
		draw_text(mouse_x+20,mouse_y+20,momentum_gain[chosen_wheel])
	}
}else{depth=2}