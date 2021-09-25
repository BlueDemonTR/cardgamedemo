if(mouse_check_button(mb_left) && point_distance(x,y,mouse_x,mouse_y) < 133){
	timer--
}else{
	if(timer != 180){timer++}
}