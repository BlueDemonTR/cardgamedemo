if(global.selectedTextBox != "cardFilter"){return;}
if(delay= 0 && !keyboard_check_pressed(vk_backspace)){
	main.filterText = string_delete(main.filterText,string_length(main.filterText),1)
	delay = 3
}