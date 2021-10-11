function scr_on_destroyed(cardNum, destroyType){
	if(scr_check_shared(cardNum, SharedUnderworldVisclades)){
		obj_player.resolutionPile[obj_player.resolutionPileCount,0] = "SharedUnderworldVisclades"
		obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
		obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
		obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
		obj_player.resolutionPileCount++
	}
	if(scr_check_shared(cardNum, SharedSacrifice)){
		if(scr_legal_activation("SharedEffect", SharedSacrifice, position)){
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = attacker.position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		}
	}
	switch(cardNum){
		case 3://Motorbiker Wildrider Activation Trigger
		case 58://Man With a Shield Activation Trigger
		case 61://Body Guard Activation Trigger
		case 63://Rebellion Ally Activation Trigger
		case 67://Pan Soldier Activation Trigger
			if(!scr_legal_activation(cardNum, 0, position)){break;}
			obj_player.resolutionPile[obj_player.resolutionPileCount,0] = cardNum
			obj_player.resolutionPile[obj_player.resolutionPileCount,1] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,2] = 0
			obj_player.resolutionPile[obj_player.resolutionPileCount,3] = position
			obj_player.resolutionPile[obj_player.resolutionPileCount,4] = false
			obj_player.resolutionPileCount++
		break;
	}
}
