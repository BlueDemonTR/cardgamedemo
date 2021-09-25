if(global.selectedTextBox != "cardFilter"){return;}
if(delay= 0 && !keyboard_check_pressed(vk_anykey)){
	main.filterText += string(keyboard_string)
	delay = 3
	keyboard_string=""
}