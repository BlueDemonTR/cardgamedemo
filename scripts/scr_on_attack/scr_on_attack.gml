function scr_on_attack(cardNum , attacker, attacked) {


	if(cardStatus[StatusSilenced]){return;}
	switch(cardNum){
		case 13://Motorbiker Leader Toku Activation Trigger
		case 72://Torch Carrier Activation Trigger
			if(!scr_legal_activation(cardNum, 0, attacker.position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = attacker.position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	
	
		case 70://Vengeful Cyborg Activation Trigger
			if(!scr_legal_activation(cardNum, 1, attacker.position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = attacker.position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPile[obj_player.resolutionPileCount,5] = attacker.cardStat[StatATK]
			obj_player.resolutionPileCount++		
		break;
	}
}
