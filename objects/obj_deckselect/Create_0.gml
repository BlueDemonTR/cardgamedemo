
selector = 0;
list_open=false;
i=0

fileList[i] = file_find_first("*.deck",0)

while(fileList[i] != ""){
	fileList[++i] = file_find_next();
}
file_find_close()
selectorCap=i;
ini_open("options.ini")
	last_deck = ini_read_string("Default","Last Deck",".deckCannotBeFound")
ini_close()
if(file_exists(last_deck)){
	if(room=room_main_menu ){macros.selectedDeck = last_deck}
	for(i = 0; i < selectorCap; i++){
		if(fileList[i] = last_deck){
			selector = i
			break;
		}
	}
	
}else if(fileList[0] = ""){
	macros.selectedDeck = "No deck is selected.plhd"
	selectorCap=0
}else{
	macros.selectedDeck = fileList[0]
}

