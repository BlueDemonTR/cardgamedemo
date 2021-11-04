if(!selected || !enterDeckName){
	return;
}
if(delay = 0 && !keyboard_check_pressed(vk_anykey)){
	deckName += string(keyboard_string)
	delay = 3
	keyboard_string=""
}