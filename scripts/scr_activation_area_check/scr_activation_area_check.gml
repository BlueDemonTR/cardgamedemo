function scr_activation_area_check() {
	return (
		x >= obj_player.activation_area_x1 
		&& x <= obj_player.activation_area_x2 
		&& y >= obj_player.activation_area_y1 
		&& y <= obj_player.activation_area_y2
	)
}
