if(mouse_wheel_down() || mouse_check_button_released(mb_left)){
	if(mouse_between(5, 655, 77, 727)){
		sharedListSelector++ //= min(max(archetypeListMax-1,0),sharedListSelector+1)
		if(sharedListSelector >= sharedListMax){
			sharedListSelector = 0
		}	
	}
	if(mouse_between(5, 520, 77, 592)){
		archetypeListSelector++ //= min(max(archetypeListMax-1,0),archetypeListSelector+1)
		if(archetypeListSelector >= archetypeListMax){
			archetypeListSelector = 0
		}	
	}
}
if(mouse_wheel_up() || mouse_check_button_released(mb_right)){
	if(mouse_between(5, 655, 77, 727)){
		sharedListSelector--// = max(sharedListSelector-1,0)
		if(sharedListSelector < 0){
			sharedListSelector = sharedListMax
		}	
	}
	if(mouse_between(5, 520, 77, 592)){
		archetypeListSelector--// = max(archetypeListSelector-1,0)
		if(archetypeListSelector < 0){
			archetypeListSelector = archetypeListMax
		}	
	}
}