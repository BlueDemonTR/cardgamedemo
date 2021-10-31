if(mouse_x < x+365){
	if(selectorCap-1 <= selector){selector = 0}
	else{selector++}
	if(fileList[selector] != ""){
		macros.selectedDeck = fileList[selector]
	}
	if(room=room_deck_builder){
		obj_deck_builder.alarm[1] = 2		
	}	
}else if(selectorCap > 1){
	list_open = !(list_open)
}
