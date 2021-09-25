function scr_on_attack(argument0,argument1,argument2) {
	var cardNum = argument0,
	attacker = argument1,
	attacked = argument2;


	if(cardStatus[11]){return;}
	switch(cardNum){

	
	
		case 13://Toku
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	
	
		case 70://Mad Cyborg
			obj_player.momentum += attacker.cardatk; 
			scr_message_stats();
		break;
	
	
	
		case 72://Torch Carrier
			scr_burn(obj_player,3,cardNum);
		break;
	}





}
