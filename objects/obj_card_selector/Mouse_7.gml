if(self.cardNum >= macros.total_cards){return;}
if(listPos >= main.filtered_card_count){return;}

if(scr_card_is_legal(cardNum) && !scr_card_is_illegal(cardNum)) {
	if(macros.card_type[cardNum] != TypeMomentum && main.deckCount < 60){
		main.deck[main.deckCount++] = [cardNum, artNum]
	}else if(main.momentumDeckCount < 7){
		main.momentumDeck[main.momentumDeckCount++] = [cardNum, artNum]
	}
	scr_count_types_in_deck()
}