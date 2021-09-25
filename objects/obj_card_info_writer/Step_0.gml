sharedListMax = macros.origSharedEffectsCount[selected_card[0]];
archetypeListMax = macros.origArchetypeCount[selected_card[0]];
if(mouse_wheel_down() || mouse_check_button_released(mb_left)){
	if(mouse_x > 5 && mouse_x < 77 && mouse_y > 655 && mouse_y < 727){
		sharedListSelector++ //= min(max(archetypeListMax-1,0),sharedListSelector+1)
	}
	if(mouse_x > 5 && mouse_x < 77 && mouse_y > 520 && mouse_y < 592){
		archetypeListSelector++ //= min(max(archetypeListMax-1,0),archetypeListSelector+1)
	}
}
if(mouse_wheel_up()){
	if(mouse_x > 5 && mouse_x < 77 && mouse_y > 655 && mouse_y < 727){
		sharedListSelector--// = max(sharedListSelector-1,0)
	}
	if(mouse_x > 5 && mouse_x < 77 && mouse_y > 520 && mouse_y < 592){
		archetypeListSelector--// = max(archetypeListSelector-1,0)
	}
}
if(sharedListSelector >= sharedListMax){sharedListSelector = 0}
if(archetypeListSelector >= archetypeListMax){archetypeListSelector = 0}
if(sharedListSelector < 0){sharedListSelector = sharedListMax}
if(archetypeListSelector < 0){archetypeListSelector = archetypeListMax}