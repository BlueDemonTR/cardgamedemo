function scr_heal_card(controller, position, hpBuff){
	//Heals a card by hpBuff, a healed can't go over it's Max HP
	//Syntax:
	//player: either obj_player or obj_opponent, decides which player's card is affected
	//position: any value between 0 and field_zone_count - 1 (generally 4)
	//hpBuff: int, how much the card will be healed
	
	var affectedCard = controller.fieldCard[position];
	
	if(affectedCard.cardStatus[StatusImmune]){return}
	
	scr_buff_card(controller, position, StatHP, hpBuff)
	
	scr_decide_field_card_stats(controller, position)
}