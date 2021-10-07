


if(obj_player.test_mode){
	if (keyboard_check_released(vk_up)){
		player.face_up = 1;
		//player.deck_buffer_x = -card_width-5;
   

	}
	if (keyboard_check_released(vk_down)){
		player.face_up = 0;
		player.deck_x_2=deck_x
	}
	if (keyboard_check_released(vk_left)){
		with(player){scr_shuffle_deck(player);}
	}
}

if(player.face_up == 1){
	with(player){
		if(mouse_y < expandy + card_height/2 && mouse_y > expandy - card_height/2){
			if(mouse_check_button_pressed(mb_left)){
				expandx = deck_x_2 - mouse_x;	
			}
			if(mouse_check_button(mb_left)){
				deck_x_2 = expandx + mouse_x;
			}
			else if(deck_x_2 >= deck_x){deck_x_2 = deck_x -1;}
			else if(deck_x_2 <= (deck_x - (deckCount -1)*(card_width+10)-deckCount*deck_buffer_x)-5){deck_x_2 = (deck_x-(deckCount)*(card_width+10) - deckCount*deck_buffer_x) + 14 + card_width;}
		}
	}
}

