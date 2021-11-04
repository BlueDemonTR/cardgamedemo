
scr_initialize_momentum_wheel();
scr_illegal_cards();

main = obj_deck_builder
filterText = ""
searchedText = ""
scr_filter_words(filterText)
maxLineCount = 0
maxLineSize = 0
for(var i = 0; i < 5; i++){
	cardList[i] = instance_create_depth(
		room_width - 220, 305 + (small_card_height + 10)*i,
		-1,
		obj_card_selector
	);
	
	with(cardList[i]){
		listNum = i
		listPos = i
		cardNum = main.filtered_cards[listPos]
		artNum = 0
		sprite_index = macros.sprite_array[cardNum,0]
	}
}
selectorCount = i;

deckCount=0;
monsterCount=0;
spellCount=0;
momentumDeckCount=0;

for(i = 0; i < 61; i++){
	deck[i, 0] = 0;
	deck[i, 1] = 0;
}
for(i = 0; i < 8; i++){
	momentumDeck[i, 0] = 0;
	momentumDeck[i, 1] = 0;
}
alarm[1] = 2