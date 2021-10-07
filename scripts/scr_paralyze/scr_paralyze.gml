function scr_paralyze(player, position) {
	//Paralyzes a card
	//Syntax:
	//player: either obj_player or obj_opponent, decides which player's card is affected
	//position: any value between 0 and field_zone_count - 1 (generally 4)
	//Why does this exist?: Some cards may have effects that trigger when a card is paralyzed,
	//Basically future proofing
	
	scr_change_card_status(player, position, StatusParalyzed, true)
}
