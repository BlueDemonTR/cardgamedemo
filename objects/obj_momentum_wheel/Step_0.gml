with(obj_player){
	if(selected_wheel > 0 && mouse_check_button_released(mb_left)){
		if (mouse_between(630, 673, 676, 717)){
			scr_wheel_effects(chosen_wheel,3)
		}
		else if (mouse_between(630, 717, 676, 760)){
			scr_wheel_effects(chosen_wheel,2)
		}
		else if (mouse_between(630, 760, 676, 804)){
			scr_wheel_effects(chosen_wheel,1)
		}
		else if (mouse_between(630, 804, 676, 850)){
			scr_wheel_effects(chosen_wheel,0)
		}
	}
}
if(obj_player.end_phase){
	for (i = 1; i <= 4; i++){
		wheel_opt[i] = false;
	}
}
