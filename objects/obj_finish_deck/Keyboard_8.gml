if(global.selectedTextBox != "deckName" || !enterDeckName){return;}
if(delay= 0 && !keyboard_check_pressed(vk_backspace)){
	deckName = string_delete(deckName,string_length(deckName),1)
	delay = 3
}