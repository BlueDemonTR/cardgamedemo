function scr_detect_field_position() {
	for (i = 0; i< 4; i++){
		if (player.main_phase){
			if (x > player.field_card_zone_x[i] - card_width/2 && x < player.field_card_zone_x[i] + card_width/2){
			if (y > player.field_card_zone_y[i] - card_height/2 && y < player.field_card_zone_y[i] + card_height/2){
				return i;
		
		
			}
			}
	
	
	
		}



	}
	return -1;




}
