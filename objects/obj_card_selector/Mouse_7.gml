if(self.cardNum >= macros.total_cards){return;}
if(listPos >= main.filtered_card_count){return;}
var cardNum= self.cardNum;
var artNum= self.artNum;
if(scr_card_is_legal(cardNum) && !scr_card_is_illegal(cardNum)) {
	
	if(macros.card_type[cardNum] != TypeMomentum && main.deckCount < 60){
		//main.deckList[main.deckCount] = instance_create_depth(475,250,-main.deckCount, obj_deck_display);
		main.deck[main.deckCount,0] = cardNum
		main.deck[main.deckCount,1] = artNum
		//with(main.deckList[main.deckCount]){
		//	self.cardNum = cardNum;
		//	self.artNum = artNum;
		//	deckPos = main.deckCount++;
		//	scr_organize_deck_list()
		//}
		main.deckCount++
	}else if(main.momentumDeckCount < 7){
		//main.momentumDeckList[main.momentumDeckCount] = instance_create_depth(475+(small_card_width)*(main.momentumDeckCount), 930,-main.momentumDeckCount, obj_deck_display);
		main.momentumDeck[main.momentumDeckCount,0] = cardNum
		main.momentumDeck[main.momentumDeckCount,1] = artNum
		//with(main.momentumDeckList[main.momentumDeckCount]){
		//	self.cardNum = cardNum;
		//	self.artNum = artNum;
		//	momentumDeckPos = main.momentumDeckCount;
		//}
		main.momentumDeckCount++		
	}
	scr_count_types_in_deck()
}