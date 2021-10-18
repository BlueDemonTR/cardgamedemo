switch(current_function){
	case "DirectAttack":
		draw_sprite(sprite_index,-1,x,y);
	break;
	case "impact":
		if(selected){
			sprite_index = spr_select_target_selected
		}else{
			sprite_index = spr_select_target_unselected
		}
		draw_sprite_stretched(sprite_index,-1,x-card_width/2,y-card_height/2,card_width,card_height);
	break;
	default:
		draw_sprite_stretched(sprite_index,-1,x-card_width/2,y-card_height/2,card_width,card_height);
	break;
}

//DEBUG
draw_text(x,y,position)


