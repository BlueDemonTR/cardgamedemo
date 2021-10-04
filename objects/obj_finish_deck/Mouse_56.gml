//0, 160 / 385, 300
if(mouse_between(0, 160, 385, 300)){
	if(main.deckCount >= 40){
		if(deckName != "" ){
			scr_deck_build_done(deckName +".deck");
		}else{
			enterDeckName = true;
			warning = "Enter Name"
			keyboard_string = "";
		}
	}else{
		warning = "Your deck must have at least 40 cards";
	}
	selected = true;
}else{
	selected = false;
}