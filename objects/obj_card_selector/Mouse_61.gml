if(mouse_x < 1620){
	return;
}

if(main.cardList[main.selectorCount-1].listPos >= main.filtered_card_count-1){
	return;
}
cardNum = main.filtered_cards[++listPos]
artNum = 0

while(scr_card_is_illegal(cardNum)){
	cardNum = main.filtered_cards[++listPos]
}
