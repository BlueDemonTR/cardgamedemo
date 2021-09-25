if(keyboard_check_pressed(vk_anykey)){
	test_mode += string(keyboard_string)
	if(keyboard_lastkey=vk_backspace){
		test_mode = string_delete(test_mode,string_length(test_mode),1)
	}	
	keyboard_string=""
}
