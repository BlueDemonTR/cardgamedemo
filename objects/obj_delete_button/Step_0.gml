if(mouse_check_button(mb_left) && point_distance(x,y,mouse_x,mouse_y) < 133){
	if(timer == 0){
		obj_deck_builder.deckCount = 0;
		obj_deck_builder.momentumDeckCount = 0;
		return
	}
	timer--
}else{
	if(timer != 180){timer++}
}