
with(obj_player){
	draw_text(1670,650,obj_infirmary.cardOnTop)
	draw_text(1670,670,infirmaryCount)
	if(obj_infirmary.cardOnTop > 0 && infirmaryCount > 0){
		for(i=0; i<infirmaryCount;i++){
			if(infirmary[i,0] !=0){
				draw_sprite_stretched(macros.sprite_array[infirmary[i,0],infirmary[i,1]],-1,infirmary_x+(deck_buffer_x*i)-card_width/2,infirmary_y-(deck_buffer_y*i)-card_height/2,card_width,card_height);
			}
		}
		draw_sprite_stretched(macros.sprite_array[obj_infirmary.cardOnTop,obj_infirmary.artOnTop],-1,infirmary_x+(deck_buffer_x*i)-card_width/2,infirmary_y-(deck_buffer_y*i)-card_height/2,card_width,card_height);	

	}
}


