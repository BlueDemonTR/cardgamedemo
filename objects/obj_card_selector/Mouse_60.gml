if(mouse_x < 1620){return;}
if(listPos == listNum){return;}
cardNum = main.filtered_cards[--listPos]
artNum = 0
while(scr_card_is_illegal(cardNum)){
	cardNum = main.filtered_cards[--listPos]
}
