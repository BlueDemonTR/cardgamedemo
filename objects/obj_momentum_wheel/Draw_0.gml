draw_set_font(fnt_default)
draw_set_color(c_black)

if(obj_player.getStatus(PlayerLockWheel)){
	lockColor = c_gray
}else{
	lockColor = c_white
}

if(obj_player.getStat(PlayerMomentum) <= 12 && obj_player.getStat(PlayerMomentum) >= 0){
	draw_sprite_ext(macros.wheelSprite[obj_player.getStat(PlayerMomentum)],-1,x,y,1,1,0,lockColor,1);
}

if(instance_exists(obj_opponent)){	
	if(obj_opponent.getStat(PlayerMomentum) <= 12){
		draw_sprite_ext(macros.wheelSprite[obj_opponent.getStat(PlayerMomentum)],-1,1300,400,1,1,180,c_white,1)
	}
}
if(obj_player.selected_wheel > 0){
	if(mouse_between(613, 673, 676, 850)){
		depth=-5
		if (mouse_between(630, 673, 676, 717)){
			draw_text(mouse_x+20,mouse_y,macros.wheel_ability[obj_player.selected_wheel, 3])
		}
		else if (mouse_between(630, 717, 676, 760)){
			draw_text(mouse_x+20,mouse_y,macros.wheel_ability[obj_player.selected_wheel, 2])
		}
		else if (mouse_between(630, 760, 676, 804)){
			draw_text(mouse_x+20,mouse_y,macros.wheel_ability[obj_player.selected_wheel, 1])
		}
		else if (mouse_between(630, 804, 676, 850)){
			draw_text(mouse_x+20,mouse_y,macros.wheel_ability[obj_player.selected_wheel, 0])
		}
		draw_text(mouse_x+20,mouse_y+20,macros.momentum_gain[obj_player.selected_wheel])
	}
}else{depth=2}