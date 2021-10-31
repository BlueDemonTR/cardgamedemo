if (mouse_x >= 785 && mouse_x <= 1230){
	
	if(mouse_y >= 280 && mouse_y <=360) {menuselect=1;}
	else if(mouse_y >= 360 && mouse_y <=450){menuselect=2;}
	else if(mouse_y >= 450 && mouse_y <=540){menuselect=3;}
	else if(mouse_y >= 540 && mouse_y <=630){menuselect=4;}
	else {menuselect=0;}
	

}
else {menuselect=0;}

for(var i=0; i < 4; i++){
	if (mouse_check_button(mb_left)&& menuselect == i+1){menu_button[i] = spr_menu_button_on}else{menu_button[i] = spr_menu_button_off}
}

if (menuselect == 1){y = 320;}
else if(menuselect == 2){y = 410;}
else if(menuselect == 3){y = 500;}
else if(menuselect == 4){y = 590;}

if(mouse_check_button_released(mb_left)){
	if (menuselect == 1 && !instance_exists(obj_client)){
		//file = get_open_filename(".txt","")
		if(scr_legal_deck_check(macros.selectedDeck)){
			instance_create_layer(0,0,"Instances", obj_client);
			if(obj_client.connect >= 0){
				ini_open("options.ini")
					ini_write_string("Default","Last Deck", macros.selectedDeck)
				ini_close()
				room_goto(room_main_game);	
			}
		}else{
			alarm[0] = 160;
		}
	}
	else if(menuselect == 2){
		room_goto(room_deck_builder);
	}
	else if(menuselect == 3){audio_play_sound(snd_test_failure,100,false);}
	else if(menuselect == 4){game_end();} 
}
if(macros.test_mode){
	if(keyboard_check(vk_enter) && keyboard_check_released(vk_backspace)){
		room_goto(room_animation_test)
	}
	if(keyboard_check(vk_enter) && keyboard_check_released(vk_control)){
		room_goto(room_sprite_generator)
	}
}
